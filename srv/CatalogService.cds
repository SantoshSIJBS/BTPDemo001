using { com.pwc.db.master } from '../db/test';

service CatalogService@(Path: 'CatalogService') {
       
    entity EmployeeSet as projection on master.employee{
        *,
        round(salary) as salary : Decimal(10,2),
        manager
    }actions{
        action hike();
        function getHighestSalary() returns array of EmployeeSet;
    };
    @Capabilities : {Updatable, Insertable : false, Deletable : false}
    entity ManagerSet as projection on master.manager;

    @readonly
    entity Books as projection on master.books;

}