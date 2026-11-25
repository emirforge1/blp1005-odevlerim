# blp1005-odevlerim
Blp1005 ders ödevleerDiagram
    REGIONS ||--o{ AGRICULTURE_QUESTIONS : contains
    CROP_CATEGORIES ||--o{ AGRICULTURE_QUESTIONS : classifies

    REGIONS {
        int region_id PK
        varchar country
        varchar geo_level2
        varchar geo_level3
    }

    CROP_CATEGORIES {
        int crop_id PK
        varchar crop_name
    }

    AGRICULTURE_QUESTIONS {
        int question_id PK
        int region_id FK
        int crop_id FK
        varchar query_year_month
        text query
        text response
    }rim 
