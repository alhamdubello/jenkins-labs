DATACENTER             := London

VARS1		:= Birminigham

VARS2		:= London

VARS3		:= Jos

INVENTY		:= $(inventory)

.phony: init

init: ansible_check

	echo "\n"

	echo "Hello World init Ansible Playbook !!! $(AWS_REGION)"

	py.test --hosts='ansible://dev_zabbixdbhosts' tests/services/test_sshd.py -vvvv

ansible_check: ansible_syntax_check

	echo "\n"

	echo "Running a ansible --check $(VARS1) $(VARS2) $(VARS3)"

	ansible-playbook -i $(INVENTY) playbooks/*.yml --check

	echo "\n"

ansible_syntax_check: ansible_lint

	echo "\n"

	echo "Running a ansible $(INVENTY) --syntax-check"

	ansible-playbook -i $(INVENTY) playbooks/*.yml --syntax-check

	echo "\n"

ansible_lint: yaml_lint

	echo "\n"

	echo "Doing Ansible Lint Here!!!"

	ansible-lint playbooks/*.yml

	echo "\n"

yaml_lint:

	echo "Doing Yaml Lint Here!!!"

	yamllint playbooks/*.yml

.phony: apply

apply: init

	echo "Now running Main Ansible Playbook ansible-playbook -i $(INVENTY)  playbook/*.yml !!!"

new:

	touch new_file

clean:

	rm -f new_file
