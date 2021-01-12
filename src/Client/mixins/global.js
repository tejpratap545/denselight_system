export default {
    data() {},
    methods: {
        getStatus(overallAppraisalStatus, appraisalStatus, midYearCompletion, completion) {
            // goals status

            if (overallAppraisalStatus === 'Stage 1' && appraisalStatus === 'Employee') {
                return 'Goals Setting Stage Pending Employee Gaol Submission'
            } else if (overallAppraisalStatus === 'Stage 1' && appraisalStatus === 'Manager') {
                return 'Goals Setting Stage Pending Manager/Supervisor Gaols Approved'
            } else if (
                overallAppraisalStatus === 'Stage 1' &&
                appraisalStatus === 'S1BEmployee' &&
                midYearCompletion === 'Uncompleted'
            ) {
                return 'Goals Setting Stage Gaols Approved'
            }
            // mid year status
            else if (overallAppraisalStatus === 'Stage 1B') {
                return 'Mid Year Pending Manager/Supervisor input'
            }

            // end year stage
            else if (overallAppraisalStatus === 'Stage 2' && appraisalStatus === 'S1BManager') {
                return 'End Year Assessment: My Rating Stage'
            } else if (overallAppraisalStatus === 'Stage 2' && appraisalStatus === 'S2Manager') {
                return 'End Year Assessment: Manager/Supervisor Rating Stage'
            } else if (overallAppraisalStatus === 'Stage 2' && appraisalStatus === 'Approved') {
                return 'End Year Assessment: Board Rating Stage'
            } else if (overallAppraisalStatus === 'Stage 3') {
                return 'End Year Assessment: Reports Stage'
            } else if (overallAppraisalStatus === 'Stage 4') {
                return 'End Year Assessment: Calibration Stage'
            } else {
                return 'Unknown Status Or Rejected'
            }
        },
        ratingName(rating) {
            switch (rating) {
                case 1:
                    return 'Major Improvement Needed'
                case 2:
                    return 'Needs Improveent'
                case 3:
                    return 'Meet Expectations'
                case 4:
                    return 'Exceed Expectations'
                case 5:
                    return 'Far Exceed Expectations'
                default:
                    return 'Far Exceed Expectations'
            }
        },
    },
}
