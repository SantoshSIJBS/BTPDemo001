namespace com.pwc.db;

using { cuid } from '@sap/cds/common';

context master {
    // First table - cds
    // Actual table - com_pwc_db_master_employee
    // Foreign Key - manager_mngr_id
    type guid: String(32);

    entity employee {
        key emp_id: String(32);
        emp_name: String(80);
        department : String(32);
        manager : Association to one manager;
        salary : Int32; 
    }

    entity manager {
        key mngr_id : String(32);
        mngr_name : String(80);
        department : String(32);
        salary : Int32;
    }

    entity books : cuid{
        bookName: String(80);
        author: String(32);
    }
}