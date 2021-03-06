package Cx

import data.generic.ansible as ansLib

CxPolicy[result] {
	task := ansLib.tasks[id][t]
	bucket := task["amazon.aws.s3_bucket"]

	bucket.policy.Statement[_].Effect == "Allow"
	contains(lower(bucket.policy.Statement[_].Action), "write")
	contains(lower(bucket.policy.Statement[_].Action), "acp")
	bucket.policy.Statement[_].Principal == "*"

	result := {
		"documentId": id,
		"searchKey": sprintf("name={{%s}}.{{amazon.aws.s3_bucket}}.policy.Statement", [task.name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("amazon.aws.s3_bucket[%s] does not allow WriteACP Action From All Principals", [bucket.name]),
		"keyActualValue": sprintf("amazon.aws.s3_bucket[%s] allows WriteACP Action From All Principals", [bucket.name]),
	}
}
