module.exports = (cds) => {

    const { ReadEmployee } = cds.entities;
    // Declaration of Employee table
    const { employee } = cds.entities("com.pwc.db.master"); 

    cds.on('hello',(req, res) => {
        return 'Welcome ' + req.data.name + ' to CAPM';
    });

    cds.on('READ', ReadEmployee, async (req, res) => {
        var oRecord = {
            emp_id : "DUMMY",
            emp_name : "Dummy Employee",
            department : "MM",
            manager_mngr_id : "12501",
            salary : 25000,
        }
        var aEmployee = [];
        // Get the employee info where salary of employee is more than 60000
        //aEmployee = await cds.tx(req).run(SELECT.from(employee).where(
        //    'salary >= 60000'
        //));
        
        
        // Get the employee info and limit is applied to 3
        aEmployee = await cds.tx(req).run(SELECT.from(employee).limit(3));
        return aEmployee;
    });
}