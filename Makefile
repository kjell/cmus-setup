add:
	echo "add ~/Music/Old-Time USB Drive from Spencer/" | cmus-remote
	echo "add ~/Music/iTunes/iTunes Media/Music/" | cmus-remote

tracks.txt:
	cmus-remote -C 'save -l -'

dupes.txt:
	fdupes --recurse ~/Music/Old-Time\ USB\ Drive\ from\ Spencer/ ~/Music/iTunes/iTunes\ Media/Music/ \
	> dupes.txt

# Make sure you're in the unfiltered library view (2) before running this, or
# it will just delete things wanton-ly
remove-duplicate-tracks: dupes.txt
	grep 'Old-Time USB Drive from Spencer' dupes.txt | while read track; do \
		echo "mark filename=\"$$track\""; \
		echo "mark filename=\"$$track\"" | cmus-remote; \
		echo "win-remove" | cmus-remote; \
	done
