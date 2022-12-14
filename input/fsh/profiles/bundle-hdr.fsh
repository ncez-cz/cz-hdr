Profile: CZ_Bundle_HDR
Parent: Bundle
Id: cz-bundle-hdr
Title: "Bundle - Hospital discharge Report"
Description: "This profile represents the constraints applied to the Bundle resource by the Czech national hospital discharge report (HDR) FHIR Implementation Guide."
* ^purpose = "Hospital discharge report (HDR) bundle is an electronic health record extract containing essential healthcare information about a subject of care, comprising at least the required elements of the HDR dataset. The HDR dataset is minimal and non-exhaustive; specialty-agnostic and condition-independent; but still clinically relevant. It is designed for supporting the use case scenario for 'continuity of care care’, but it is not limited to it."
//* obeys bdl-ips-1
* . ^short = "Hospital Discharge Report Bundle"
* . ^definition = "Hospital Discharge Report Bundle. \r\nA container for a collection of resources in the hospital discharge document."
* identifier 1.. MS
* type = #document (exactly)
* timestamp 1.. MS
* link ..0
* entry 1.. MS
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open
* entry ^short = "Entry resource in the hospital discharge report bundle"
* entry ^definition = "An entry resource included in the hospital discharge report document bundle resource."
* entry ^comment = "Must contain the HDR Composition as the first entry (only a single Composition resource instance may be included).  Additional constraints are specified in the HDR Composition profile."
* entry.fullUrl 1.. MS
* entry.search ..0
* entry.request ..0
* entry.response ..0
* entry contains
    composition 1..1 and
    patient 1..1 and
    allergyintolerance 0..* and
    condition 0..* and
    device 0..* and
    deviceusestatement 0..* and
    diagnosticreport 0..* and
    imagingstudy 0..* and
    immunization 0..* and
    media 0..* and
    medication 0..* and
    medicationrequest 0..* and
    medicationstatement 0..* and
    medicationdispense 0..* and
    practitioner 0..* and
    practitionerrole 0..* and
    procedure 0..* and
    organization 0..* and
    //observation-pregnancy-edd 0..* and
    //observation-pregnancy-outcome 0..* and
    //observation-pregnancy-status 0..* and
    observation-alcohol-use 0..* and
    observation-tobacco-use 0..* and
    observation-results 0..* and
    specimen 0..*
* entry[composition].resource 1..
* entry[composition].resource only CZ_CompositionHdr
* entry[patient].resource 1..
* entry[patient].resource only CZ_Patient
* entry[allergyintolerance].resource 1..
* entry[allergyintolerance].resource only CZ_AllergyIntolerance
* entry[condition].resource 1..
* entry[condition].resource only ConditionUvIps // CZ
* entry[device].resource 1..
* entry[device].resource only Device  // CZ
* entry[deviceusestatement].resource 1..
* entry[deviceusestatement].resource only DeviceUseStatementUvIps  // CZ
* entry[diagnosticreport].resource 1..
* entry[diagnosticreport].resource only DiagnosticReportUvIps  // CZ
* entry[imagingstudy].resource 1..
* entry[imagingstudy].resource only ImagingStudyUvIps   // CZ
* entry[immunization].resource 1..
* entry[immunization].resource only ImmunizationUvIps  // CZ
* entry[media].resource 1..
* entry[media].resource only MediaObservationUvIps  // CZ
* entry[medication].resource 1..
* entry[medication].resource only CZ_Medication
* entry[medicationrequest].resource 1..
* entry[medicationrequest].resource only CZ_MedicationRequest
* entry[medicationstatement].resource 1..
* entry[medicationstatement].resource only CZ_MedicationStatement
* entry[medicationdispense].resource 1..
* entry[medicationdispense].resource only CZ_MedicationDispense
* entry[practitioner].resource 1..
* entry[practitioner].resource only CZ_Practitioner
* entry[practitionerrole].resource 1..
* entry[practitionerrole].resource only CZ_PractitionerRole
* entry[procedure].resource 1..
* entry[procedure].resource only ProcedureUvIps // CZ
* entry[organization].resource 1..
* entry[organization].resource only CZ_Organization
//* entry[observation-pregnancy-edd].resource 1..
//* entry[observation-pregnancy-edd].resource only ObservationPregnancyEddUvIps
//* entry[observation-pregnancy-outcome].resource 1..
//* entry[observation-pregnancy-outcome].resource only ObservationPregnancyOutcomeUvIps
//* entry[observation-pregnancy-status].resource 1..
//* entry[observation-pregnancy-status].resource only ObservationPregnancyStatusUvIps
* entry[observation-alcohol-use].resource 1..
* entry[observation-alcohol-use].resource only ObservationAlcoholUseUvIps
* entry[observation-tobacco-use].resource 1..
* entry[observation-tobacco-use].resource only ObservationTobaccoUseUvIps
* entry[observation-results].resource 1..
* entry[observation-results].resource only ObservationResultsUvIps
* entry[specimen].resource 1..
* entry[specimen].resource only SpecimenUvIps