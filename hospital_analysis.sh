#!/bin/bash
process_vitals(){
#grep to search for CRITICAL row in heart_rate_logs, and awk to get TIMESTAMP, Device_id and value based on how they are organised ($1 for time, $2 for device id and $3 for value, and then save them into reports/critical_alerts
grep "CRITICAL" active_logs/heart_rate_log.log | awk -F '|' '{print $1, $2, $3}' >> reports/critical_alerts.txt
#grep to search for CRITICAL row in temperature_logs, and awk to get TIMESTAMP, Device_id and value based on how they are organised ($1 for time, $2 for device id and 3 for value and then append them into reports/critical_alerts.txt
grep "CRITICAL" active_logs/temperature_log.log | awk -F '|' '{print $1, $2, $3}' >> reports/critical_alerts.txt
}
process_vitals


