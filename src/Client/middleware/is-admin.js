export default async function ({ $auth, redirect, store }) {
    const user = $auth.user.user
    if (user && user.role === 'Admin') {
        // let the user in
    } else {
        store.dispatch('notifier/showMessage', {
            color: 'error',
            content: 'You must be an admin to view that page.',
        })
        redirect('/')
    }
}
