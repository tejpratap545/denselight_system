export default {
    data() {},
    methods: {
        getStatus(overallAppraisalStatus, appraisalStatus) {
            if (overallAppraisalStatus === 'Stage 1') {
                return 'Goals Setting Stage'
            } else if (overallAppraisalStatus === 'Stage 1B') {
                return 'Mid Year Assessment: Pending Manager/Supervisor'
            } else if (overallAppraisalStatus === 'Stage 2' && appraisalStatus === 'S2Employee') {
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
                return 'Unknown Status'
            }
        },
    },
}
