with __dbt__cte__texas_counties as (


SELECT *
FROM (VALUES ('001', 'ANDERSON'),
             ('002', 'ANDREWS'),
             ('003', 'ANGELINA'),
             ('004', 'ARANSAS'),
             ('005', 'ARCHER'),
             ('006', 'ARMSTRONG'),
             ('007', 'ATASCOSA'),
             ('008', 'AUSTIN'),
             ('009', 'BAILEY'),
             ('010', 'BANDERA'),
             ('011', 'BASTROP'),
             ('012', 'BAYLOR'),
             ('013', 'BEE'),
             ('014', 'BELL'),
             ('015', 'BEXAR'),
             ('016', 'BLANCO'),
             ('017', 'BORDEN'),
             ('018', 'BOSQUE'),
             ('019', 'BOWIE'),
             ('020', 'BRAZORIA'),
             ('021', 'BRAZOS'),
             ('022', 'BREWSTER'),
             ('023', 'BRISCOE'),
             ('024', 'BROOKS'),
             ('025', 'BROWN'),
             ('026', 'BURLESON'),
             ('027', 'BURNET'),
             ('028', 'CALDWELL'),
             ('029', 'CALHOUN'),
             ('030', 'CALLAHAN'),
             ('031', 'CAMERON'),
             ('032', 'CAMP'),
             ('033', 'CARSON'),
             ('034', 'CASS'),
             ('035', 'CASTRO'),
             ('036', 'CHAMBERS'),
             ('037', 'CHEROKEE'),
             ('038', 'CHILDRESS'),
             ('039', 'CLAY'),
             ('040', 'COCHRAN'),
             ('041', 'COKE'),
             ('042', 'COLEMAN'),
             ('043', 'COLLIN'),
             ('044', 'COLLINGSWORTH'),
             ('045', 'COLORADO'),
             ('046', 'COMAL'),
             ('047', 'COMANCHE'),
             ('048', 'CONCHO'),
             ('049', 'COOKE'),
             ('050', 'CORYELL'),
             ('051', 'COTTLE'),
             ('052', 'CRANE'),
             ('053', 'CROCKETT'),
             ('054', 'CROSBY'),
             ('055', 'CULBERSON'),
             ('056', 'DALLAM'),
             ('057', 'DALLAS'),
             ('058', 'DAWSON'),
             ('059', 'DEAF SMITH'),
             ('060', 'DELTA'),
             ('061', 'DENTON'),
             ('062', 'DEWITT'),
             ('063', 'DICKENS'),
             ('064', 'DIMMIT'),
             ('065', 'DONLEY'),
             ('066', 'DUVAL'),
             ('067', 'EASTLAND'),
             ('068', 'ECTOR'),
             ('069', 'EDWARDS'),
             ('070', 'EL PASO'),
             ('071', 'ELLIS'),
             ('072', 'ERATH'),
             ('073', 'FALLS'),
             ('074', 'FANNIN'),
             ('075', 'FAYETTE'),
             ('076', 'FISHER'),
             ('077', 'FLOYD'),
             ('078', 'FOARD'),
             ('079', 'FORT BEND'),
             ('080', 'FRANKLIN'),
             ('081', 'FREESTONE'),
             ('082', 'FRIO'),
             ('083', 'GAINES'),
             ('084', 'GALVESTON'),
             ('085', 'GARZA'),
             ('086', 'GILLESPIE'),
             ('087', 'GLASSCOCK'),
             ('088', 'GOLIAD'),
             ('089', 'GONZALES'),
             ('090', 'GRAY'),
             ('091', 'GRAYSON'),
             ('092', 'GREGG'),
             ('093', 'GRIMES'),
             ('094', 'GUADALUPE'),
             ('095', 'HALE'),
             ('096', 'HALL'),
             ('097', 'HAMILTON'),
             ('098', 'HANSFORD'),
             ('099', 'HARDEMAN'),
             ('100', 'HARDIN'),
             ('101', 'HARRIS'),
             ('102', 'HARRISON'),
             ('103', 'HARTLEY'),
             ('104', 'HASKELL'),
             ('105', 'HAYS'),
             ('106', 'HEMPHILL'),
             ('107', 'HENDERSON'),
             ('108', 'HIDALGO'),
             ('109', 'HILL'),
             ('110', 'HOCKLEY'),
             ('111', 'HOOD'),
             ('112', 'HOPKINS'),
             ('113', 'HOUSTON'),
             ('114', 'HOWARD'),
             ('115', 'HUDSPETH'),
             ('116', 'HUNT'),
             ('117', 'HUTCHINSON'),
             ('118', 'IRION'),
             ('119', 'JACK'),
             ('120', 'JACKSON'),
             ('121', 'JASPER'),
             ('122', 'JEFF DAVIS'),
             ('123', 'JEFFERSON'),
             ('124', 'JIM HOGG'),
             ('125', 'JIM WELLS'),
             ('126', 'JOHNSON'),
             ('127', 'JONES'),
             ('128', 'KARNES'),
             ('129', 'KAUFMAN'),
             ('130', 'KENDALL'),
             ('131', 'KENEDY'),
             ('132', 'KENT'),
             ('133', 'KERR'),
             ('134', 'KIMBLE'),
             ('135', 'KING'),
             ('136', 'KINNEY'),
             ('137', 'KLEBERG'),
             ('138', 'KNOX'),
             ('139', 'LA SALLE'),
             ('140', 'LAMAR'),
             ('141', 'LAMB'),
             ('142', 'LAMPASAS'),
             ('143', 'LAVACA'),
             ('144', 'LEE'),
             ('145', 'LEON'),
             ('146', 'LIBERTY'),
             ('147', 'LIMESTONE'),
             ('148', 'LIPSCOMB'),
             ('149', 'LIVE OAK'),
             ('150', 'LLANO'),
             ('151', 'LOVING'),
             ('152', 'LUBBOCK'),
             ('153', 'LYNN'),
             ('154', 'MADISON'),
             ('155', 'MARION'),
             ('156', 'MARTIN'),
             ('157', 'MASON'),
             ('158', 'MATAGORDA'),
             ('159', 'MAVERICK'),
             ('160', 'MCCULLOCH'),
             ('161', 'MCLENNAN'),
             ('162', 'MCMULLEN'),
             ('163', 'MEDINA'),
             ('164', 'MENARD'),
             ('165', 'MIDLAND'),
             ('166', 'MILAM'),
             ('167', 'MILLS'),
             ('168', 'MITCHELL'),
             ('169', 'MONTAGUE'),
             ('170', 'MONTGOMERY'),
             ('171', 'MOORE'),
             ('172', 'MORRIS'),
             ('173', 'MOTLEY'),
             ('174', 'NACOGDOCHES'),
             ('175', 'NAVARRO'),
             ('176', 'NEWTON'),
             ('177', 'NOLAN'),
             ('178', 'NUECES'),
             ('179', 'OCHILTREE'),
             ('180', 'OLDHAM'),
             ('181', 'ORANGE'),
             ('182', 'PALO PINTO'),
             ('183', 'PANOLA'),
             ('184', 'PARKER'),
             ('185', 'PARMER'),
             ('186', 'PECOS'),
             ('187', 'POLK'),
             ('188', 'POTTER'),
             ('189', 'PRESIDIO'),
             ('190', 'RAINS'),
             ('191', 'RANDALL'),
             ('192', 'REAGAN'),
             ('193', 'REAL'),
             ('194', 'RED RIVER'),
             ('195', 'REEVES'),
             ('196', 'REFUGIO'),
             ('197', 'ROBERTS'),
             ('198', 'ROBERTSON'),
             ('199', 'ROCKWALL'),
             ('200', 'RUNNELS'),
             ('201', 'RUSK'),
             ('202', 'SABINE'),
             ('203', 'SAN AUGUSTINE'),
             ('204', 'SAN JACINTO'),
             ('205', 'SAN PATRICIO'),
             ('206', 'SAN SABA'),
             ('207', 'SCHLEICHER'),
             ('208', 'SCURRY'),
             ('209', 'SHACKELFORD'),
             ('210', 'SHELBY'),
             ('211', 'SHERMAN'),
             ('212', 'SMITH'),
             ('213', 'SOMERVELL'),
             ('214', 'STARR'),
             ('215', 'STEPHENS'),
             ('216', 'STERLING'),
             ('217', 'STONEWALL'),
             ('218', 'SUTTON'),
             ('219', 'SWISHER'),
             ('220', 'TARRANT'),
             ('221', 'TAYLOR'),
             ('222', 'TERRELL'),
             ('223', 'TERRY'),
             ('224', 'THROCKMORTON'),
             ('225', 'TITUS'),
             ('226', 'TOM GREEN'),
             ('227', 'TRAVIS'),
             ('228', 'TRINITY'),
             ('229', 'TYLER'),
             ('230', 'UPSHUR'),
             ('231', 'UPTON'),
             ('232', 'UVALDE'),
             ('233', 'VAL VERDE'),
             ('234', 'VAN ZANDT'),
             ('235', 'VICTORIA'),
             ('236', 'WALKER'),
             ('237', 'WALLER'),
             ('238', 'WARD'),
             ('239', 'WASHINGTON'),
             ('240', 'WEBB'),
             ('241', 'WHARTON'),
             ('242', 'WHEELER'),
             ('243', 'WICHITA'),
             ('244', 'WILBARGER'),
             ('245', 'WILLACY'),
             ('246', 'WILLIAMSON'),
             ('247', 'WILSON'),
             ('248', 'WINKLER'),
             ('249', 'WISE'),
             ('250', 'WOOD'),
             ('251', 'YOAKUM'),
             ('252', 'YOUNG'),
             ('253', 'ZAPATA'),
             ('254', 'ZAVALA')
         ) AS A (COUNTY_ID,COUNTY_NAME)
) SELECT '2023-11-28'::date      as INPUT_FILE_DATE,
       'TX'                    AS INPUT_STATE,
       C.COUNTY_NAME           AS INPUT_COUNTY,
       NCOA.INPUT_ID           AS INPUT_VOTER_ID,
       NCOA.INPUT_LASTNAME     AS INPUT_LAST_NAME,
       NCOA.INPUT_FIRSTNAME    AS INPUT_FIRST_NAME,
       NCOA.INPUT_MIDDLENAME   AS INPUT_MIDDLE_NAME,
       NCOA.INPUT_SUFFIX       AS INPUT_SUFFIX,
       NCOA.INPUT_ADDRESSLINE1 AS INPUT_ADDRESS_LINE_1,
       NCOA.INPUT_ADDRESSLINE2 AS INPUT_ADDRESS_LINE_2,
       NCOA.INPUT_CITY         AS INPUT_RESIDENCE_CITY,
       NCOA.INPUT_STATE        AS INPUT_RESIDENCE_STATE,
       NCOA.INPUT_ZIPCODE      AS INPUT_RESIDENCE_ZIPCODE,
       NCOA.HOUSEHOLD_POSITION,
       NCOA.NAME_ID,
       NCOA.INDIVIDUAL_RECORD_ID,
       NCOA.FIRST_NAME,
       NCOA.LAST_NAME,
       NCOA.COMPANY_NAME,
       NCOA.STREET_NUMBER,
       NCOA.STREET_PRE_DIRECTION,
       NCOA.STREET_NAME,
       NCOA.STREET_POST_DIRECTION,
       NCOA.STREET_SUFFIX,
       NCOA.UNIT_TYPE,
       NCOA.UNIT_NUMBER,
       NCOA.BOX_NUMBER,
       NCOA.CITY_NAME,
       NCOA.STATE_CODE,
       NCOA.POSTAL_CODE,
       NCOA.POSTAL_CODE_EXTENSION,
       NCOA.CARRIER_ROUTE,
       NCOA.ADDRESS_STATUS,
       NCOA.ERROR_NUMBER,
       NCOA.ADDRESS_TYPE,
       NCOA.DELIVERY_POINT,
       NCOA.CHECK_DIGIT,
       NCOA.DELIVERY_POINT_VERIFICATION,
       NCOA.DELIVERY_POINT_VERIFICATION_NOTES,
       NCOA.VACANT,
       NCOA.CONGRESSIONAL_DISTRICT_CODE,
       NCOA.AREA_CODE,
       NCOA.LATITUDE,
       NCOA.LONGITUDE,
       NCOA.TIME_ZONE,
       NCOA.COUNTY_NAME,
       NCOA.COUNTY_FIPS,
       NCOA.STATE_FIPS,
       NCOA.BARCODE,
       NCOA.LOCATABLE_ADDRESS_CONVERSION_SYSTEM,
       NCOA.LINE_OF_TRAVEL,
       NCOA.ASCENDING_OR_DESCENDING,
       NCOA.MOVE_APPLIED,
       NCOA.MOVE_TYPE,
       NCOA.MOVE_DATE,
       NCOA.MOVE_DISTANCE,
       NCOA.MATCH_FLAG,
       NCOA.NXI,
       NCOA.ANK,
       NCOA.RESIDENTIAL_DELIVERY_INDICATOR,
       NCOA.RECORD_TYPE,
       NCOA.COUNTRY_CODE,
       NCOA.ADDRESS_LINE_1,
       NCOA.ADDRESS_LINE_2,
       NCOA.ADDRESS_ID,
       NCOA.HOUSEHOLD_ID,
       NCOA.INDIVIDUAL_ID
FROM RAW.TEXAS_NCOA_RESULTS_2023_11_28 NCOA
         INNER JOIN RAW.TEXAS_PROCESSED_DATA_2023_11_28 V ON NCOA.INPUT_ID = V.VUID
         INNER JOIN __dbt__cte__texas_counties C
                    ON V.COUNTY_CODE = C.COUNTY_ID
WHERE INPUT_ID NOT IN (
                       '2002582657',
                       '1031674244',
                       '1031674244',
                       '2002582657'
    )