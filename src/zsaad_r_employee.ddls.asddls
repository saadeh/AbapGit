@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EMPLOYEE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSAAD_R_EMPLOYEE 
as select from zsaad_employee
association[1..1] to zsaad_depment as _Department on $projection.DepartmentId = _Department.id

{
    key employee_id as EmployeeId,
    first_name as FirstName,
    last_name as LastName,
    some_field as SomeField,
    department_id as DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    annual_salary as AnnualSalary,
    currency_code as CurrencyCode,
    component_to_be_changed as ComponentToBeChanged,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _Department
}
