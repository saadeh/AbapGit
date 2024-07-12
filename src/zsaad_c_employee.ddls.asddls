@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EMPLOYEE QUERY'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zsaad_c_employee as select from ZSAAD_R_EMPLOYEE
{
    key EmployeeId,
    FirstName,
    LastName,
    SomeField,
    DepartmentId,
    AnnualSalary,
    CurrencyCode,
    ComponentToBeChanged,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Department
}
