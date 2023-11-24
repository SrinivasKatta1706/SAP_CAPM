using { Srinivas.db.master } from '../db/datamodel';


service Catalogservice {

    entity employeSet as projection on master.employees;
    entity pgdetailsSet as projection on master.pgdetails;
    entity tenantdetalsSet as projection on master.tenantdetals;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity BPSet as projection on master.businesspartner;

}