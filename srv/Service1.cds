using { com.pwc.db.master } from '../db/test';

service Service1 @(path: 'ServiceOne'){
    
    function hello(name: String) returns String;

    @readonly
    entity ReadEmployee as projection on master.employee;

    @updateonly
    entity UpdateEmployee as projection on master.employee;

    @insertonly
    entity insertEmployee as projection on master.employee;

    @deleteonly
    entity DeleteEmployee as projection on master.employee;
}