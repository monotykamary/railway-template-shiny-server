#!/usr/bin/env python3
import os,re,json,urllib.request,urllib.parse
b=os.environ['BASE_URL'].rstrip('/');phase=os.environ['SMOKE_PHASE'];assert phase in ('boot','upgrade','redeploy')
with urllib.request.urlopen(b+'/',timeout=60) as r:assert r.status==200;body=r.read().decode()
assert 'Interactive R applications on Railway' in body and 'histogram' in body
asset=re.search(r'<script[^>]*src="([^"]*shiny[^"?]*\.js(?:\?[^"]*)?)"',body)
assert asset,'Shiny client asset missing'
with urllib.request.urlopen(urllib.parse.urljoin(b+'/',asset.group(1)),timeout=30) as r:assert r.status==200 and len(r.read())>1000
print(json.dumps({'ok':True,'phase':phase,'http_ui_assets':True,'reactive_plot_test_required':'paired R testServer exec','state':'stateless'}))
