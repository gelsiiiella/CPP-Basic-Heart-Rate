#include "heart_rate_register_types.h"
#include "heart_rate_module.h" // Include your "Heart Rate" module header

void register_heart_rate_types() {
    // Register your "Heart Rate" module classes here
    ClassDB::register_class<HeartRateModule>();
    // Add more registrations if you have additional classes
}

void unregister_heart_rate_types() {
    // Unregister your "Heart Rate" module classes here
    // (Not always necessary unless you have specific cleanup to perform)
}


