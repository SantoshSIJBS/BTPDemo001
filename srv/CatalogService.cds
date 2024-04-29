using { com.pwc.db.master } from '../db/test';

service CatalogService@(Path: 'CatalogService') {

        
        entity EmployeeSet as projection on master.employee;

    @Capabilities : {Updatable, Insertable : false, Deletable : false}
    entity ManagerSet as projection on master.manager;

    entity Books as projection on master.books;

}