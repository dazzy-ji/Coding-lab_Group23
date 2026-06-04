#!/bin/bash
water_audit(){
        local data_file="active_logs/water_usage_log.log"
        # here i'm checking if the file exists so that i can continue
        if [[ ! -f "$data_file" ]]; then
                echo "Error: Data file '$data_file' not found."
                return 1
        fi
        echo "Facility Audit: Water Usage"
        echo "---------------------------"
        awk -F '[ ]*\\|[ ]*' '
        BEGIN {
                sum=0;
                count=0;
        }
        {
                if ($2 == "ICU_WATER_RESERVE") {
                        sum += $3;
                        count++;
                }
        }
        END {
                if (count > 0) {
                        average = sum / count;
                        printf "Resource Target: %s\n", "ICU_WATER_RESERVE"
                        printf "Total Records: %d\n", count
                        printf "Total Vol Used: %.2f Liters\n", sum
                        printf "Average usage: %.2f Liters/min\n", average
                } else {
                        printf "No records found for %s./n", "ICU_WATER_RESERVE"
                }
        }
        ' "$data_file"
        }
process_vitals(){
#grep to search for CRITICAL row in heart_rate_logs, and awk to get TIMESTAMP, Device_id and value based on how they are organised ($1 for time, $2 for device id and $3 for value, and then save them into reports/critical_alerts
grep "CRITICAL" active_logs/heart_rate_log.log | awk -F '|' '{print $1, $2, $3}' >> reports/critical_alerts.txt
#grep to search for CRITICAL row in temperature_logs, and awk to get TIMESTAMP, Device_id and value based on how they are organised ($1 for time, $2 for device id and 3 for value and then append them into reports/critical_alerts.txt
grep "CRITICAL" active_logs/temperature_log.log | awk -F '|' '{print $1, $2, $3}' >> reports/critical_alerts.txt
}
process_vitals
water_audit
