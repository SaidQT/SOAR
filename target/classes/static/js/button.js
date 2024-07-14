document.addEventListener('DOMContentLoaded', function() {
    const hamburgerBtn = document.getElementById('hamburger-btn');
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('main-content');

    if (hamburgerBtn) {
        hamburgerBtn.addEventListener('click', function() {
            sidebar.classList.toggle('open');
            if (sidebar.classList.contains('open')) {
                mainContent.style.marginLeft = '250px'; // Adjust main content when sidebar opens
                hamburgerBtn.style.display = "block"; // Ensure hamburger button is visible when sidebar opens
				sidebar.style.display = "block";


            } else {
                mainContent.style.marginLeft = '0'; // Reset margin when sidebar closes
                hamburgerBtn.style.display = "block"; // Ensure hamburger button is visible when sidebar closes
				sidebar.style.display = "none";

            }
        });
    }

    // Close sidebar when clicking outside or on navbar links
    document.addEventListener('click', function(event) {
        const target = event.target;
        const isSidebar = target.closest('#sidebar') === sidebar;
        const isHamburger = target === hamburgerBtn;
        const isNavbarLink = target.tagName.toLowerCase() === 'a' && target.closest('#sidebar') === sidebar;

        if (!isSidebar && !isHamburger && !isNavbarLink && sidebar.classList.contains('open')) {
            sidebar.classList.remove('open');
            mainContent.style.marginLeft = '0';
        }
    });
});

