create TABLE IMF_WEODATA (
    [WEO Country Group Code] VARCHAR(3),
    [WEO Subject Code] VARCHAR(255),
    [Country Group Name] VARCHAR(255),
    [Subject Descriptor] VARCHAR(255),
    [Subject Notes] VARCHAR(1500),
    [Units] VARCHAR(255),
    [Scale] VARCHAR(255),
    [Series-specific Notes] VARCHAR(1500),
    [1980] VARCHAR(25),
    [1981] VARCHAR(25),
    [1982] VARCHAR(25),
    [1983] VARCHAR(25),
    [1984] VARCHAR(25),
    [1985] VARCHAR(25),
    [1986] VARCHAR(25),
    [1987] VARCHAR(25),
    [1988] VARCHAR(25),
    [1989] VARCHAR(25),
    [1990] VARCHAR(25),
    [1991] VARCHAR(25),
    [1992] VARCHAR(25),
    [1993] VARCHAR(25),
    [1994] VARCHAR(25),
    [1995] VARCHAR(25),
    [1996] VARCHAR(25),
    [1997] VARCHAR(25),
    [1998] VARCHAR(25),
    [1999] VARCHAR(25),
    [2000] VARCHAR(25),
    [2001] VARCHAR(25),
    [2002] VARCHAR(25),
    [2003] VARCHAR(25),
    [2004] VARCHAR(25),
    [2005] VARCHAR(25),
    [2006] VARCHAR(25),
    [2007] VARCHAR(25),
    [2008] VARCHAR(25),
    [2009] VARCHAR(25),
    [2010] VARCHAR(25),
    [2011] VARCHAR(25),
    [2012] VARCHAR(25),
    [2013] VARCHAR(25),
    [2014] VARCHAR(25),
    [2015] VARCHAR(25),
    [2016] VARCHAR(25),
    [2017] VARCHAR(25),
    [2018] VARCHAR(25),
    [2019] VARCHAR(25),
    [2020] VARCHAR(25),
    [2021] VARCHAR(25),
    [2022] VARCHAR(25),
    [2023] VARCHAR(25),
    [2024] VARCHAR(25),
    [Estimates Start After] VARCHAR(255)
);
go

create TABLE WORLDBANK_EASE_COUNTRY_METADATA (
    COUNTRY_CODE VARCHAR(50),
    REGION VARCHAR(255),
    INCOME_GROUP VARCHAR(255),
    SPECIAL_NOTES VARCHAR(1500),
    TABLE_NAME VARCHAR(100)
);
go

create TABLE WORLDBANK_EASE_COUNTRY_INDEX (
    [Country_Name] VARCHAR(255),
    [Country_Code] VARCHAR(255),
    [Indicator_Code] VARCHAR(255),
    [Year] INT,
    [Val] INT
);
go

create TABLE BEA_NIPA (
    [TableName] VARCHAR(255),
    [SeriesCode] VARCHAR(255),
    [LineNumber] INT,
    [LineDescription] VARCHAR(255),
    [TimePeriod] INT,
    [METRIC_NAME] VARCHAR(255),
    [CL_UNIT] VARCHAR(255),
    [UNIT_MULT] INT,
    [DataValue] INT,
    [NoteRef] INT
);
go

create TABLE BEA_MNE_COUNTRY (
    [DIRECTIONOFINVESTMENT] VARCHAR(255),
    [OwnershipLevel] INT,
    [Year] INT,
    [SeriesID] INT,
    [SeriesName] VARCHAR(255),
    [Row] VARCHAR(255),
    [Column] VARCHAR(255),
    [RowCode] VARCHAR(255),
    [ColumnCode] VARCHAR(255),
    [TableScale] VARCHAR(255),
    [DataValueUnformatted] VARCHAR(255),
    [DataValue] VARCHAR(255)
);
go

create TABLE BEA_MNE_COUNTRY_BY_INDUSTRY (
    [DIRECTIONOFINVESTMENT] VARCHAR(255),
    [OwnershipLevel] INT,
    [Year] INT,
    [SeriesID] INT,
    [SeriesName] VARCHAR(255),
    [Row] VARCHAR(255),
    [Column] VARCHAR(255),
    [RowCode] VARCHAR(255),
    [ColumnCode] VARCHAR(255),
    [TableScale] VARCHAR(255),
    [DataValueUnformatted] VARCHAR(255),
    [DataValue] VARCHAR(255)
);
go

create TABLE BEA_MNE_COUNTRY_UBO_BY_INDUSTRY (
    [DIRECTIONOFINVESTMENT] VARCHAR(255),
    [OwnershipLevel] INT,
    [Year] INT,
    [SeriesID] INT,
    [SeriesName] VARCHAR(255),
    [Row] VARCHAR(255),
    [Column] VARCHAR(255),
    [RowCode] VARCHAR(255),
    [ColumnCode] VARCHAR(255),
    [TableScale] VARCHAR(255),
    [DataValueUnformatted] VARCHAR(255),
    [DataValue] VARCHAR(255)
);
go

create TABLE BEA_MNE_INDUSTRY (
    [DIRECTIONOFINVESTMENT] VARCHAR(255),
    [OwnershipLevel] INT,
    [Year] INT,
    [SeriesID] INT,
    [SeriesName] VARCHAR(255),
    [Row] VARCHAR(255),
    [Column] VARCHAR(255),
    [RowCode] VARCHAR(255),
    [ColumnCode] VARCHAR(255),
    [TableScale] VARCHAR(255),
    [DataValueUnformatted] VARCHAR(255),
    [DataValue] VARCHAR(255)
);
go

create TABLE BEA_ITA (
    [Indicator] VARCHAR(255),
    [AreaOrCountry] VARCHAR(255),
    [Frequency] VARCHAR(255),
    [Year] INT,
    [TimeSeriesId] VARCHAR(255),
    [TimeSeriesDescription] VARCHAR(255),
    [TimePeriod] VARCHAR(255),
    [CL_UNIT] VARCHAR(255),
    [UNIT_MULT] VARCHAR(255),
    [DataValue] INT
);
go

create TABLE OTEXA_DATA_SET_CAT (
   CTRY_ID INTEGER
  , CAT_ID INTEGER
  , SYEF DECIMAL(5,2)
  , HEADER_ID VARCHAR(25)
  , VAL DECIMAL(30, 10)
);

create TABLE OTEXA_CATEGORY_REF (
   CAT_ID  INTEGER
  , CAT_DESCRIPTION VARCHAR(255)
);
go

create TABLE OTEXA_COUNTRY_REF (
   CTRY_ID  INTEGER
  , CTRY_DESCRIPTION VARCHAR(255)
);
go

create TABLE OTEXA_HEADER_REF (
   HEADER_ID  VARCHAR(15)
  , YR INTEGER
  , HEADER_DESCRIPTION VARCHAR(255)
  , HEADER_TYPE VARCHAR(255)
);
go

create view OTEXA_DATA_SET_CAT_VW
as
select details.CTRY_ID
    , details.CAT_ID
    , details.HEADER_ID
    , case when hdr.HEADER_TYPE = 'UNITS' then details.VAL / details.SYEF else details.VAL end as ADJ_VAL
from OTEXA_DATA_SET_CAT details
inner join OTEXA_HEADER_REF hdr
on details.HEADER_ID = hdr.HEADER_ID;
go

create TABLE IESE_VCPE_INDEX (
   Regioncountry                                           VARCHAR(20) NOT NULL
  , Score_or_Rank                                          VARCHAR(5) NOT NULL
  , [0_Index]                                              NUMERIC(5,1) NOT NULL
  , [1_Economic_Activity]                                  NUMERIC(5,1) NOT NULL
  , [11_Size_of_the_Economy_GDP]                           NUMERIC(5,1) NOT NULL
  , [12_Expected_Real_GDP_Growth]                          NUMERIC(5,1) NOT NULL
  , [13_Unemployment]                                      NUMERIC(5,1) NOT NULL
  , [2_Capital_Market]                                     NUMERIC(5,1) NOT NULL
  , [21_Size_and_Liquidity_of_the_Stock_Market]            NUMERIC(5,1) NOT NULL
  , [211_Market_Capitalization_of_Listed_Companies]        NUMERIC(5,1) NOT NULL
  , [23_IPOs_and_Public_Issuing_Activity]                  NUMERIC(5,1) NOT NULL
  , [24_MA_Market]                                         NUMERIC(5,1) NOT NULL
  , [25_Debt_and_Credit_Market]                            NUMERIC(5,1) NOT NULL
  , [26_Bank_Non_Performing_Loans_to_Toal_Gross_Loans]     NUMERIC(5,1) NOT NULL
  , [27_Financial_Market_Sophistication]                   NUMERIC(5,1) NOT NULL
  , [3_Taxation]                                           NUMERIC(5,1) NOT NULL
  , [31_Entrepreneurial_Tax_Incentives_and_Admin_Burden]   NUMERIC(5,1) NOT NULL
  , [4_Investor_Protection_and_Corporate_Governance]       NUMERIC(5,1) NOT NULL
  , [41_Quality_of_Corporate_Governance]                   NUMERIC(5,1) NOT NULL
  , [42_Security_of_Property_Rights]                       NUMERIC(5,1) NOT NULL
  , [43_Quality_of_Legal_Enforcement]                      NUMERIC(5,1) NOT NULL
  , [5_Human_and_Social_Environment]                       NUMERIC(5,1) NOT NULL
  , [51_Education_and_Human_Capital]                       NUMERIC(5,1) NOT NULL
  , [52_Labor_Regulations]                                 NUMERIC(5,1) NOT NULL
  , [53_Bribing_and_Corruption]                            NUMERIC(5,1) NOT NULL
  , [6_Entrepreneurial_Opportunities]                      NUMERIC(5,1) NOT NULL
  , [61_Innovation]                                        NUMERIC(5,1) NOT NULL
  , [62_Scientific_and_Technical_Journal_Articles]         NUMERIC(5,1) NOT NULL
  , [63_Burdens_of_Starting_and_Running_a_Business]        NUMERIC(5,1) NOT NULL
  , [64_Simplicity_of_Closing_a_Business]                  NUMERIC(5,1) NOT NULL
  , [65_Corporate_RD]                                      NUMERIC(5,1) NOT NULL
);
go