module.exports = cds.service.impl( async function() {
    // Get the object
    const { EmployeeSet } = this.entities;

    // Define Generic Handler
    this.before('UPDATE', EmployeeSet, (req, res) => {
        if(parseFloat(req.data.salary) >= 10000000 ){
            req.error(500,"Salary must be less than a million");
        }
    })
})