document.addEventListener('DOMContentLoaded', function () {
    const rulesContainer = document.getElementById('rules-container');
    const addRuleButton = document.getElementById('add-rule');
    const saveButton = document.getElementById('save');

    // 从storage加载配置
    loadRules();

    addRuleButton.addEventListener('click', addRule);
    saveButton.addEventListener('click', saveRules);

    function createRuleElement(rule) {
        const ruleDiv = document.createElement('div');
        ruleDiv.classList.add('rule');

        const urlRow = document.createElement('div');
        urlRow.innerHTML = `
            <label>原始URL:</label>
            <input type="text" class="original-url" value="${rule ? rule.originalUrl : ''}">
            <label>替换URL:</label>
            <input type="text" class="replace-url" value="${rule ? rule.replaceUrl : ''}">
        `;
        ruleDiv.appendChild(urlRow);

        const headersLabel = document.createElement('label');
        headersLabel.textContent = '请求头:';
        ruleDiv.appendChild(headersLabel);

        const headersContainer = document.createElement('div');
        headersContainer.classList.add('headers-container');
        ruleDiv.appendChild(headersContainer);

        if (rule && rule.headers) {
            rule.headers.forEach(header => addHeaderRow(headersContainer, header.name, header.value));
        } else {
            addHeaderRow(headersContainer, '', ''); // 初始添加一个空的header row
        }

        const addHeaderButton = document.createElement('button');
        addHeaderButton.textContent = '添加请求头';
        addHeaderButton.addEventListener('click', () => addHeaderRow(headersContainer, '', ''));
        ruleDiv.appendChild(addHeaderButton);

        const removeRuleButton = document.createElement('button');
        removeRuleButton.textContent = '删除规则';
        removeRuleButton.addEventListener('click', () => ruleDiv.remove());
        ruleDiv.appendChild(removeRuleButton);

        return ruleDiv;
    }

    function addHeaderRow(container, name = '', value = '') {
        const headerRow = document.createElement('div');
        headerRow.classList.add('header-row');
        headerRow.innerHTML = `
            <input type="text" class="header-name" placeholder="Header Name" value="${name}">
            <input type="text" class="header-value" placeholder="Header Value" value="${value}">
            <button class="remove-header">删除</button>
        `;
        const removeButton = headerRow.querySelector('.remove-header');
        removeButton.addEventListener('click', () => headerRow.remove());
        container.appendChild(headerRow);
    }

    function addRule() {
        const newRuleElement = createRuleElement();
        rulesContainer.appendChild(newRuleElement);
    }


    function saveRules() {
        const rules = [];
        const ruleElements = rulesContainer.querySelectorAll('.rule');

        ruleElements.forEach(ruleElement => {
            const originalUrl = ruleElement.querySelector('.original-url').value;
            const replaceUrl = ruleElement.querySelector('.replace-url').value;
            const headers = [];
            const headerRows = ruleElement.querySelectorAll('.header-row');
            headerRows.forEach(headerRow => {
                const name = headerRow.querySelector('.header-name').value;
                const value = headerRow.querySelector('.header-value').value;
                if (name && value) {
                    headers.push({ name, value });
                }
            });
            rules.push({ originalUrl, replaceUrl, headers });
        });

        chrome.storage.sync.set({ rules: rules }, () => {
            alert('保存成功！');
        });
    }

    function loadRules() {
        chrome.storage.sync.get('rules', (data) => {
            if (data.rules) {
                data.rules.forEach(rule => {
                    const ruleElement = createRuleElement(rule);
                    rulesContainer.appendChild(ruleElement);
                });
            } else {
                addRule(); // 初始添加一个空的规则
            }
        });
    }
});
