DROP TABLE IMF_WEODATA; --REMOVE WHEN GOING TO PROD
IF OBJECT_ID('dbo.IMF_WEODATA', 'U') IS NULL
BEGIN
    CREATE TABLE IMF_WEODATA (
        [WEO Country Group Code] varchar(3),
        [WEO Subject Code] varchar(255),
        [Country Group Name] varchar(255),
        [Subject Descriptor] varchar(255),
        [Subject Notes] varchar(1500),
        [Units] varchar(255),
        [Scale] varchar(255),
        [Series-specific Notes] varchar(1500),
        [1980] varchar(25),
        [1981] varchar(25),
        [1982] varchar(25),
        [1983] varchar(25),
        [1984] varchar(25),
        [1985] varchar(25),
        [1986] varchar(25),
        [1987] varchar(25),
        [1988] varchar(25),
        [1989] varchar(25),
        [1990] varchar(25),
        [1991] varchar(25),
        [1992] varchar(25),
        [1993] varchar(25),
        [1994] varchar(25),
        [1995] varchar(25),
        [1996] varchar(25),
        [1997] varchar(25),
        [1998] varchar(25),
        [1999] varchar(25),
        [2000] varchar(25),
        [2001] varchar(25),
        [2002] varchar(25),
        [2003] varchar(25),
        [2004] varchar(25),
        [2005] varchar(25),
        [2006] varchar(25),
        [2007] varchar(25),
        [2008] varchar(25),
        [2009] varchar(25),
        [2010] varchar(25),
        [2011] varchar(25),
        [2012] varchar(25),
        [2013] varchar(25),
        [2014] varchar(25),
        [2015] varchar(25),
        [2016] varchar(25),
        [2017] varchar(25),
        [2018] varchar(25),
        [2019] varchar(25),
        [2020] varchar(25),
        [2021] varchar(25),
        [2022] varchar(25),
        [2023] varchar(25),
        [2024] varchar(25),
        [Estimates Start After] varchar(255)
    )
END

------------------------------------------------

DROP TABLE WORLDBANK_EASE_COUNTRY_METADATA; --REMOVE WHEN GOING TO PROD
IF OBJECT_ID('dbo.WORLDBANK_EASE_COUNTRY_METADATA', 'U') IS NULL
BEGIN
    CREATE TABLE WORLDBANK_EASE_COUNTRY_METADATA (
        COUNTRY_CODE VARCHAR(50),
        REGION VARCHAR(255),
        INCOME_GROUP VARCHAR(255),
        SPECIAL_NOTES VARCHAR(1500),
        TABLE_NAME VARCHAR(100)
    )
END