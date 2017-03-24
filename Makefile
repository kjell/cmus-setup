add:
	echo "add ~/Music/" | cmus-remote

tracks.txt:
	cmus-remote -C 'save -l -'

dupes.txt:
	fdupes --recurse --omitfirst ~/Music/ \
		| grep -v .jpg \
		| grep -v '.DS_Store' \
		> dupes.txt

# Make sure you're in the unfiltered library view (2) before running this, or
# it will just delete things wanton-ly
remove-duplicate-tracks: dupes.txt
	grep -v '^$$' dupes.txt | while read track; do \
		echo "mark filename=\"$$track\""; \
		echo "mark filename=\"$$track\"" | cmus-remote; \
		echo "win-remove" | cmus-remote; \
	done

documentReadme:
	@(sed '/---/q' readme.md; \
  echo "\n# Commands\n"; \
	ls scripts/ | grep -v '^_' | sort | while read script; do \
			echo "## \`$$script\`"; \
			echo "$$(tail -n+2 scripts/$$script | head -7 | grep '^#\|^$$' | sed 's/^#//g; s/^ //g')"; \
			echo; \
	done | remark) | sponge readme.md
