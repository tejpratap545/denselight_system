export default async function ({ $auth, redirect, store }) {
    const user = $auth.user.user
    if (user && (user.role === 'Hr' || user.role === 'HRManager')) {
        // let the user in
    } else {
        store.dispatch('notifier/showMessage', {
            color: 'error',
            content: 'You must be hr to view that page.',
        })
        redirect('/')
    }
}
