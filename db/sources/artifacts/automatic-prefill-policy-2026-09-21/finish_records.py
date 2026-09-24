from pathlib import Path
import subprocess,json
r=Path(__file__).parent;db=Path('/Users/carlos/Projects/slotstream/db');decision='records/decisions/automatic-prefill-read-policy'
old='records/decisions/prefill-opportunities-remain-experimental.md'
subprocess.run(['dbmd','fm','set',old,'status=reversed','--json'],cwd=db,check=True)
notes={old:'Reversed as a product-default decision by [['+decision+']] at the user’s explicit direction. The new timing study also fails its frozen speed gate; all original evidence and thresholds below remain historical facts. Functional and memory validation support the bounded automatic adoption, without a new qualified speed claim.',
'records/decisions/qualified-upstream-fused-prefill.md':'Follow-up: fused-workspace accounting and larger expert reads now form the guarded automatic policy in [['+decision+']]. The kernel qualification and measured gain below remain unchanged; larger compute passes and sparse alternatives remain unadopted.'}
for path,note in notes.items():
 body=(db/path).read_text().split('\n---\n',1)[1]
 draft=r/'record-drafts'/('updated-'+Path(path).name);draft.write_text(note+'\n\n'+body)
 subprocess.run(['dbmd','body','set',path,'--body-file',str(draft),'--json'],cwd=db,check=True)
(r/'registration-status.json').write_text(json.dumps({'complete':True,'initial_failure':'The frontmatter CLI required an explicit store context; record creation and the historical measurement note succeeded before it.','correction':'Resume remaining metadata and derived-record updates from the store directory. No record was recreated and no raw wrapper modified.'},indent=2)+'\n')
