#HARSHRAJ JADEJA

#Q7
#Most common risk types coming from which sectors

SELECT
	a.RISK_TYPE,
    b.SECTOR,
    COUNT(*)
FROM 
	FINDING a
    INNER JOIN AUDIT_REPORT b
    ON AUDIT_REPORT.AUDIT_REPORT_NUMBER = FINDING.AUDIT_REPORT_NUMBER
GROUP BY 1,2;


#Q8
#time spend on audit vs severity (avg days - severity)

SELECT
	a.SEVERITY,
    b.SECTOR,
    DATEDIFF(b.END_DATE, b.START_DATE) AS avg_days
FROM 
	FINDING a
    INNER JOIN AUDIT_REPORT b
    ON AUDIT_REPORT.AUDIT_REPORT_NUMBER = FINDING.AUDIT_REPORT_NUMBER
GROUP BY 1,2;


#Q9
#return all audits that have more than 2 auditors (also check for the completion time for the same - see if its less than the ones with less auditors)

SELECT 
	a.AUDIT_REPORT_NUMBER,
    COUNT(DISTINCT a.EMPLOYEE_ID) AS Number_of_Auditors,
    DATEDIFF(b.END_DATE, b.START_DATE) AS avg_days
FROM
	AUDITOR_REPORT a
    INNER JOIN AUDIT_REPORT b
    ON AUDITOR_REPORT.AUDIT_REPORT_NUMBER = AUDITOR_REPORT.AUDIT_REPORT_NUMBER
GROUP BY 1;


#Q10
#average processes per audit

SELECT
	AUDIT_REPORT_NUMBER,
    COUNT(DISTINCT PROCESS_ID) as Number_of_Processes
FROM 
	AUDIT_PROCESS
GROUP BY 1;
    
    
    
