namespace com.pwc.db;

using { cuid, Currency } from '@sap/cds/common';

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

    context transaction {
        entity purchseorder : cuid{
            po_id : String(32);
            status : String(1);
            overall_status : String(1);
            items: Composition of many item on items.parent_key = $self;
        }
        entity item: cuid {
            parent_key : Association to purchseorder;
            po_item : Integer;
            amount : Int64;
        }

    }
}