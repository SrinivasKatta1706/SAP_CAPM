namespace Srinivas.db;
using { cuid, managed, Currency } from '@sap/cds/common';
using { Srinivas.common } from './common';

type Guid : String(20);


context master {

    entity pgdetails{
        key PG_ID: String(10);
           PG_NAME: String(10);
    }
    entity tenantdetals{
          PG_ID: String(10);
           PG_NAME: String(10);
           TENANT_ID: String(4);
       key TENANT_NAME: String(20);
           ADDRESS: String(40);
           PHONE_NUMBER: String(10);
           ROOM_NO: String(10);
           CHECKIN_DATE: Date;
           CHECKOUT_DATE: Date;


    }
    entity employees : cuid, managed {
        nameFirst : String(40);
        nameMiddle : String(40);
        nameLast : String(40);
        nameInitials : String(40);
        sex :common.gender;
        language: String(1);
        phoneNumber: common.PhoneNumber;
        email : common.email;
        loginName : String(12);
        currency_code : String(3);
        salaryAmount : common.AmountT;
        accountNumber : String(16);
        bankId : String(8);
        bankName : String(16);

        
    }
    entity product {
        key NODE_KEY: Guid;
        PRODUCT_ID: String(28);
        TYPE_CODE: String(2);
        CATEGORY: String(32);
        DESCRIPTION: localized String(255);
        SUPPLIER_GUID: Association to master.businesspartner;
        TAX_TARIF_CODE: Integer;
        MEASURE_UNIT: String(2);
        WEIGHT_MEASURE	: Decimal(5,2);
        WEIGHT_UNIT: String(2);
        CURRENCY_CODE:String(4);
        PRICE: Decimal(15,2);
        WIDTH:Decimal(5,2);	
        DEPTH:Decimal(5,2);	
        HEIGHT:	Decimal(5,2);
        DIM_UNIT:String(2);

    }
     entity businesspartner {
        key NODE_KEY : Guid;
        BP_ROLE	:String(2);
        EMAIL_ADDRESS :String(105);
        PHONE_NUMBER: String(32);
        FAX_NUMBER: String(32);
        WEB_ADDRESS:String(44);	
        ADDRESS_GUID: Association to address;	
        BP_ID: String(32);	
        COMPANY_NAME: String(250);
    }
    entity address {
        key NODE_KEY: Guid;
        CITY: String(44);
        POSTAL_CODE: String(8);
        STREET: String(44);
        BUILDING:String(128)  ;
        COUNTRY: String(44);
        ADDRESS_TYPE: String(44);
        VAL_START_DATE: Date;
        VAL_END_DATE:Date;
        LATITUDE: Decimal;
        LONGITUDE: Decimal;
        businesspartner: Association to one businesspartner on businesspartner.ADDRESS_GUID = $self;
    }
    annotate employees with {
        emp_desc @title : '{i18n>ep_desc}';
        emp_status @tile : '{i18n>emp_status}';
    };
    
    
}