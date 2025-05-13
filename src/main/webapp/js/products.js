document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('productSearch');
    const rows = document.querySelectorAll('table tbody tr');
    const noResultsRow = document.getElementById('noResultsMessageRow');

    searchInput.addEventListener('input', function () {
        const query = this.value.toLowerCase();
        let matchCount = 0;

        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            const isMatch = text.includes(query);
            row.style.display = isMatch ? '' : 'none';
            if (isMatch) matchCount++;
        });

        noResultsRow.style.display = matchCount === 0 ? '' : 'none';
    });
})