# BigQuery

- Configuration[#Configuration]
- Configuration files[#Configuration-files]
    - Dataset configuration[#Dataset-configuration]
  	- Table configuration[#Table-configuration]
    - View configuration[#View-configuration]

## Configuration

The minimal configuration for dataset is `dataset/meta/dataset.json` file which contains the dataset configuration - by adding the `dataset/meta/dataset.json` file only you are allowed to create an empty dataset, without any content (tables, views, etc.)


```
dataset_config_dir
└───dataset
│   └───meta
|       └───dataset.json <REQUIRED>
└───tables
│   └───meta
│   |   │   table1.json
│   |   │   table2.json
│   |   └───...
│   └───schema
│       │   table1.json
│       |   table2.json
│       └───...
└───views
│   └───meta
│   |   │   view1.json
│   |   |   view2.json
|   |   └───...
│   └───schema
│   |   │   view1.sql
│   |   |   view2.sql
|   |   └───...
│   └───sql
│       │   view1.json
│       |   view2.json
│       └───...
...
```

## Configuration files

For configuration file examples navigate to [bq-dataset/example/](/gcp/bq-dataset/example/).

### Dataset configuration

Files required for dataset:
- `dataset/meta.json`

```json
// dataset/meta.json
{
    // required
    "dataset_name": "my_dataset",
    "description": "description",
    // optional
    "friendly_name" : "friendly_name",
    "labels": {
        "key1": "value1",
        "key2": "value2"
    },
}

```

### Table configuration

Files required for table:
- `tables/meta/<table_name>.json`
- `tables/schema/<table_name>.json`

```json
// tables/meta/table1.json
{
    "labels": {
        "tablelabel1": "value1",
        "tablelabel2": "value2"
    }
}
```

```json
// tables/schema/table1.json
[
    {
        "name": "field_1",
        "type": "STRING",
        "mode": "REQUIRED",
        "description": "field_1 description"
    },
    {
        "name": "field_2",
        "type": "INTEGER",
        "mode": "NULLABLE",
        "description": "field_2 description"
    }
]
```

### View configuration

View configuration is similar to [table configuration](#table-configuration).
In addition, it contains `sql` file providing the `view` definition.

```sql
// views/sql/view1.sql
SELECT
    "abc" as field_1,
    1 as field_2
```

View schema cannot contain `REQUIRED` fields - use `NULLABLE` mode instead.
