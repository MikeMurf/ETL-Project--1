-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "confirmed_cases" (
    "conf_case_id" INT   NOT NULL,
    "province_state" VARCHAR(30)   NOT NULL,
    "country_region" VARCHAR(30)   NOT NULL,
    "lat" FLOAT   NOT NULL,
    "lon" FLOAT   NOT NULL,
    CONSTRAINT "pk_confirmed_cases" PRIMARY KEY (
        "conf_case_id","province_state"
     )
);

CREATE TABLE "deaths" (
    "death_id" INT   NOT NULL,
    "province_state" VARCHAR(30)   NOT NULL,
    "country_region" VARCHAR(30)   NOT NULL,
    "lat" FLOAT   NOT NULL,
    "lon" FLOAT   NOT NULL,
    "conf_case_id" INT   NOT NULL,
    CONSTRAINT "pk_deaths" PRIMARY KEY (
        "province_state"
     )
);

CREATE TABLE "recovered" (
    "province_state" VARCHAR(30)   NOT NULL,
    "country_region" VARCHAR(30)   NOT NULL,
    "lat" FLOAT   NOT NULL,
    "lon" FLOAT   NOT NULL,
    "conf_case_id" INT   NOT NULL,
    CONSTRAINT "pk_recovered" PRIMARY KEY (
        "province_state"
     )
);

CREATE TABLE "vaccine_data" (
    "province_state" VARCHAR(30)   NOT NULL,
    "country_region" VARCHAR(30)   NOT NULL,
    "date" DATE   NOT NULL,
    "Doses_admin" INT   NOT NULL,
    "partially_vac" INT   NOT NULL,
    "fully_vac" INT   NOT NULL,
    "date_str" VARCHAR   NOT NULL,
    "uid" INT   NOT NULL,
    "conf_case_id" INT   NOT NULL,
    CONSTRAINT "pk_vaccine_data" PRIMARY KEY (
        "province_state"
     )
);

CREATE TABLE "world_pop" (
    "country_name" VARCHAR(30)   NOT NULL,
    "country_code" VARCHAR(30)   NOT NULL,
    "indicator_code" VARCHAR(20)   NOT NULL,
    "pop_year" INT   NOT NULL,
    "conf_case_id" INT   NOT NULL
);

ALTER TABLE "deaths" ADD CONSTRAINT "fk_deaths_conf_case_id" FOREIGN KEY("conf_case_id")
REFERENCES "confirmed_cases" ("conf_case_id");

ALTER TABLE "recovered" ADD CONSTRAINT "fk_recovered_conf_case_id" FOREIGN KEY("conf_case_id")
REFERENCES "confirmed_cases" ("conf_case_id");

ALTER TABLE "vaccine_data" ADD CONSTRAINT "fk_vaccine_data_conf_case_id" FOREIGN KEY("conf_case_id")
REFERENCES "confirmed_cases" ("conf_case_id");

ALTER TABLE "world_pop" ADD CONSTRAINT "fk_world_pop_conf_case_id" FOREIGN KEY("conf_case_id")
REFERENCES "confirmed_cases" ("conf_case_id");

