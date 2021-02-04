export default async function ({ $auth, redirect, store }) {
    const user = $auth.user.user
    if ((user && user.role === 'Manager') || user.role === 'HRManager' || user.role === 'Hr') {
        // let the user in
    } else {
        store.dispatch('notifier/showMessage', {
            color: 'error',
            content: 'You must be  manager to view that page.',
        })
        redirect('/')
    }
}
