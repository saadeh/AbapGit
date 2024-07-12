@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department Query'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSAAD_C_DEPARTMENTQUERY as select from ZSAAD_C_EMPLOYEE_QRY
{
//    key EmployeeId,
//    FirstName,
//    LastName,
//    SomeField,
//    DepartmentId,
//    AnnualSalary,
//    CurrencyCode,
//    ComponentToBeChanged,
//    CreatedBy,
//    CreatedAt,
//    LocalLastChangedBy,
//    LocalLastChangedAt,
//    LastChangedAt,
//    EmployeeRole,
//    MonthSalary,
//    FullName,
//    CompanyAffiliation,
//    AnnualSalaryConv,
//    /* Associations */
//    _Department

    DepartmentId,
    _Department.description as DepartmentDescription,   
    avg( CompanyAffiliation as abap.dec(11,1) ) as AverageAffiliation,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    sum( AnnualSalaryConv ) as TotalSalary,
    CurrencyCode    
}
group by
    DepartmentId,
    _Department.description,
    CurrencyCode
