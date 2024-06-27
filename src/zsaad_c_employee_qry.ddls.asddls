@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EMPLOYEE QUERY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSAAD_C_EMPLOYEE_QRY as select from ZSAAD_R_EMPLOYEE
{
    key EmployeeId,
    FirstName,
    LastName,
    SomeField,
    DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    CurrencyCode,
    ComponentToBeChanged,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Department,
    case EmployeeId
        when _Department.head_id then 'H'
        when _Department.assistent then 'A'
        else ' '
        end as EmployeeRole,
    cast(AnnualSalary as abap.fltp ) / 12.0 as MonthSalary    
        
}
