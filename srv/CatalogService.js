module.exports = cds.service.impl( async function() {
    // Get the object
    const { EmployeeSet } = this.entities;

    // Define Generic Handler
    this.before('UPDATE', EmployeeSet, (req, res) => {
        if(parseFloat(req.data.salary) >= 10000000 ){
            req.error(500,"Salary must be less than a million");
        }
    });

    this.on('hike', async(req, res) => {
        try {
            const id = req.params[0];
            const tx = cds.tx(req);
            await tx.update(EmployeeSet).with({
                salary: { '+=' : 10000 }
            }).where(id)
        } catch (error) {
            return "Error " + error.toString();
        }
    });

    // Function for Heighest Salary of an employee from the Employee Set
    this.on('getHighestSalary', async (req,res) => {
        try {
            
            // Step-1 : "Instantiate transaction object using CDS.TX
            const tx = cds.tx(req);
            
            // Step - 2 : Read the Employee Set and get the heighest salary
            const reply = await tx.read(EmployeeSet).orderBy({
                salary: 'desc'
            }).limit(1);

            // Return the employee 
            return reply;
        } catch (error) {
            return "Error" + error.toString();
        }

    });
})