install:
	sudo cp ./lfrun /usr/bin/lfrun
	sudo chmod +x /usr/bin/lfrun
	@if [ ! -d ~/.config/lf/ ]; then\
		mkdir -p ~/.config/lf ;\
	fi
	cp ./preview ~/.config/lf/preview
	chmod +x ~/.config/lf/preview
	@if [ -z "$(shell sed -n '/set previewer/p' ~/.config/lf/lfrc)" ]; then\
		sed -i '1 i\set previewer ~/.config/lf/preview' ~/.config/lf/lfrc ;\
	fi
	@if [ -z "$(shell sed -n '/set ratios/p' ~/.config/lf/lfrc)" ]; then\
		sed -i '1 i\set ratios 1:2:3' ~/.config/lf/lfrc ;\
	fi

uninstall:
	sudo rm /usr/bin/lfrun
	sed -i '/set previewer/d' ~/.config/lf/lfrc
	sed -i '/set ratios/d' ~/.config/lf/lfrc

