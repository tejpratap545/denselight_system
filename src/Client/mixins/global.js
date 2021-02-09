export default {
    data() {
        return {
            ratings: [
                {
                    value: 1,
                    name: '1. Major Improvement Needed',
                },
                {
                    value: 2,
                    name: '2. Needs Improvement',
                },
                {
                    value: 3,
                    name: '3. Meet Expectations',
                },
                {
                    value: 4,
                    name: '4. Exceed Expectations',
                },
                {
                    value: 5,
                    name: '5. Far Exceed Expectations',
                },
            ],
            rules: {
                required: (value) => !!value || 'Required.',
                email: (v) => /.+@.+/.test(v) || 'E-mail must be valid',
            },
        }
    },

    methods: {
        getStatus(overallAppraisalStatus, appraisalStatus, midYearCompletion, completion) {
            // goals status

            if (overallAppraisalStatus === 'Stage 1' && appraisalStatus === 'Employee') {
                return 'Goals Setting Stage Pending Employee Goals Submission'
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
            else if (
                overallAppraisalStatus === 'Stage 2' &&
                (appraisalStatus === 'S1BManager' || appraisalStatus === 'S2Employee')
            ) {
                return 'End Year Assessment: My Rating Stage'
            } else if (overallAppraisalStatus === 'Stage 2' && appraisalStatus === 'S2Manager') {
                return 'End Year Assessment: Manager/Supervisor Rating Stage'
            } else if (overallAppraisalStatus === 'Stage 2' && appraisalStatus === 'Approved') {
                return 'End Year Assessment: Moderation commitee rating(final)'
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
                    return '1. Major Improvement Needed'
                case 2:
                    return '2. Needs Improvement'
                case 3:
                    return '3. Meet Expectations'
                case 4:
                    return '4. Exceed Expectations'
                case 5:
                    return '5. Far Exceed Expectations'
                default:
                    return ''
            }
        },
    },
}
