# Kata10: Hashes vs. Classes
If we’re programming business applications in a language such as Java or C#, we’re used to constructing and using classes to manipulate our business objects. Is this always the right way to go, or would a less formal approach serves us well sometimes?

This week’s topic doesn’t involve a coding challenge. Instead, we’re thinking about design and tradeoffs.

Imagine that you’ve been asked to write an export utility for a large and complex database. The export has to read data from 30 or so tables (perhaps 100 columns are potentially written to each export record). Some of the exported data is written exactly as read from the database, but other exported data must be calculated. In addition, if certain flag fields have specific values, then additional data must be read from the database to complete an export row.

The export data must obviously be correct, but the client is also asking for a flexible solution; their world changes a lot.

One solution is to use existing business objects and existing persistence mechanisms, and to use higher-level classes to aggregate their results into a form that can be used to generate export rows. This higher level object could perform the calculations necessary for the virtual fields, and read in additional business objects if the flag fields dictate.

An alternative solution might be to read the data row at a time into a Hash (an associative array, dictionary, …) using ad-hoc queries, keying the hash on the field names. A separate pass could then be made to perform any necessary calculations, storing the results back in to the same hash. Additional data could be read from the database if the flag fields are set, again storing the results in the hash. The contents of the hash are then used to write the export record, and we loop back to do the next row.

This kata is a thought experiment. What are the top three advantages and top three disadvantages of the two approaches? If you’re been using classes to hold data in your business applications, what would the impact be if you were to switch to hashes, and vice versa? Is this issue related to the static/dynamic typing debate?
