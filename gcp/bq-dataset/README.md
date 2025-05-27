# BigQuery

- Configuration[#Configuration]
- Configuration files[#Configuration-files]
    - Dataset configuration[#Dataset-configuration]
  	- Table configuration[#Table-configuration]
    - View configuration[#View-configuration]

## Configuration

The minimal configuration is:
- TBC...

```
dataset_config_dir
└───dataset
|   └───meta.json
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
│   |   │   view1.json
│   |   |   view2.json
|   |   └───...
│   └───schema
│       │   view1.json
│       |   view2.json
│       └───...
...
```

## Configuration files

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