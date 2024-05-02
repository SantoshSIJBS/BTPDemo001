using CatalogService as service from '../../srv/CatalogService';
annotate service.EmployeeSet with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'emp_id',
                Value : emp_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'emp_name',
                Value : emp_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'department',
                Value : department,
            },
            {
                $Type : 'UI.DataField',
                Label : 'manager_mngr_id',
                Value : manager_mngr_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'salary',
                Value : salary,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'emp_id',
            Value : emp_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'emp_name',
            Value : emp_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'department',
            Value : department,
        },
        {
            $Type : 'UI.DataField',
            Label : 'manager_mngr_id',
            Value : manager_mngr_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'salary',
            Value : salary,
        },
    ],
);

annotate service.EmployeeSet with {
    manager @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ManagerSet',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : manager_mngr_id,
                ValueListProperty : 'mngr_id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'mngr_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'department',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'salary',
            },
        ],
    }
};

