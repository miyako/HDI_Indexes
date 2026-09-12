![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_Indexes

A guided tour of the four 4D index types -- standard B-tree, cluster B-tree, composite, and keyword -- showing how each is created, deleted, and how it changes query and sort timings. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v11**; restored so it runs on current 4D releases.

## What it demonstrates

- Creating each index type at runtime with `CREATE INDEX` using the selectors `Standard BTree index`, `Cluster BTree index`, and `Keywords index`.
- Removing indexes by name with `DELETE INDEX`.
- Building composite (multi-field) indexes by passing an array of field pointers to `CREATE INDEX`.
- Measuring the effect of an index: query and sort operations are timed with `Milliseconds` (via `ChronoStart`/`ChronoStop`) and reported through `BuildTextInfos`.
- Populating a two-table sample dataset (`[COMPANIES]` and related `[CONTACTS]`) with fake data generated inside an `On Timer` loop.
- Searching with `QUERY` -- wildcard prefix queries on an indexed text field and the keyword `%` operator against a keyword-indexed field.
- Sorting with `ORDER BY` on single and multiple fields to contrast plain versus composite-indexed sorts.
- Persisting which index types are currently built in an `[INDEX_SETTINGS]` record so the interface can reflect state across launches.

## Key commands

| Command | Used for |
|---|---|
| `CREATE INDEX` | Build B-tree, cluster, composite, and keyword indexes on `[COMPANIES]`/`[CONTACTS]` fields |
| `DELETE INDEX` | Drop an index by its name |
| `QUERY` | Prefix (`Name=x@`) and keyword (`Information%x`) searches |
| `ORDER BY` | Single- and multi-field sorts to show index impact |
| `Milliseconds` | Time queries and sorts for the performance panel |
| `RELATE MANY SELECTION` | Load related `[CONTACTS]` for the selected companies |
| `SET TIMER` | Drive the incremental data-generation and index-build loops |
| `Sequence number` | Assign sequential primary-key values to generated records |

## Data model

`catalog.4DCatalog` defines three tables:

- `[COMPANIES]` -- `Name`, `Address`, `ZipCode`, `City`, `State`, `Country`, `Phone`, plus a large `Information` text field used for keyword searches.
- `[CONTACTS]` -- `LastName`, `FirstName`, address fields, and a `CompanyID` foreign key relating each contact to a company.
- `[INDEX_SETTINGS]` -- four boolean flags (`B_Trees`, `Clusters`, `Composite`, `Keywords`) recording which index groups are currently built.

The pre-declared indexes in the catalog (`Index_Btree_01..06`, `Index_Cluster_01..05`, `Index_Composite_01..02`, `Index_Keywords_01`) mirror the names the code creates and deletes.

## How it works

`On_Open` (from the `On Startup` database method) selects a language-specific data file (`On_Open_SelectData`), ensures an `[INDEX_SETTINGS]` record exists, clears any leftover indexes when the data is empty, and launches the demo process through `PS_IndexesDemo`, which opens the `D_Indexes` form.

`D_Indexes` is a single multi-page form navigated by a hierarchical list; `Bouton 3D1`/`Bouton 3D2` step `<>Page` backward/forward. The form method (`Forms/D_Indexes/method.4dm`) is the core of the demo -- its `On Timer` handler both generates data and builds indexes:

- **Page 1 (data generation):** each timer tick creates one `[COMPANIES]` record plus a random number of related `[CONTACTS]` records, filling fields via `FakeData_FillFields`, until `<>NbCompanies` companies exist.
- **Pages 2/4/6/8 (index build/delete):** a small state machine keyed on `<>Thermo` sets up an array of field pointers and index names, then per tick calls `CREATE INDEX(... ; Standard BTree index | Cluster BTree index | Keywords index; ...)` or `DELETE INDEX(...)`. Composite indexes pass two field pointers in one array. Each finishes by recording state with `SetIndexState` and refreshing button enablement with `SetIndexButtons`.

The demo pages (3, 5, 7, 9) let you feel the difference: the `SearchValue*` object methods wrap `QUERY` in `ChronoStart`/`ChronoStop` and push the elapsed time into `BuildTextInfos`; `Bouton14..18` do the same for `ORDER BY`. Page 9 runs a keyword search with `QUERY([COMPANIES]; [COMPANIES]Information % $text)` and highlights the hit in the record with `HIGHLIGHT TEXT`.

The single most instructive method is the `On Timer` case in the form method: it shows the idiomatic pattern of building a table/field-pointer array and passing it to `CREATE INDEX`, one index per tick, so a progress bar can advance.

## Points of interest

- The generic build loop resolves the target table from the field pointer with `Table(Table(<>_Ptr{i}))`, so the same code indexes fields in either `[COMPANIES]` or `[CONTACTS]`.
- A composite index is just a standard B-tree index created over an ordered array of field pointers -- the demo builds `State`+`City` and `LastName`+`FirstName` this way.
- Keyword indexes are created with the `Keywords index` selector on the free-text `Information` field and queried with the `%` (contains keyword) operator, not `=`.
- `DELAY PROCESS(Current process; 10)` is inserted between index operations purely so the progress thermometer is visible even when an index builds almost instantly.
- Index state is deliberately persisted in `[INDEX_SETTINGS]` rather than inferred, so the Create/Delete buttons stay consistent after quitting and relaunching.

## References

- [4D documentation: CREATE INDEX](https://developer.4d.com/docs/commands/create-index)
- [4D documentation: DELETE INDEX](https://developer.4d.com/docs/commands/delete-index)
- [4D documentation: QUERY](https://developer.4d.com/docs/commands/query)
- [4D documentation: ORDER BY](https://developer.4d.com/docs/commands/order-by)
- [4D documentation: Milliseconds](https://developer.4d.com/docs/commands/milliseconds)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/4ef4f921-380c-4d57-844f-0e857af0e7fd" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/b26139bb-50bd-4eae-b375-2ac33fe47db1" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/1c77d67c-78f5-409f-892e-279a678d90fe" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/e706d8ee-c782-4d2c-ac99-6deb6df4d412" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/efee43d1-50e8-42bf-9768-2f53b9d8facd" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/7294d711-993c-4898-b050-b5d5fe9a9cef" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/6ac09e12-ea4a-4f7a-8bed-01a37b3f6619" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/10d52416-06bd-4230-b027-6ca476a6284c" />
<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/34c4b088-bfc6-48aa-b50d-2d832a67f4f4" />
