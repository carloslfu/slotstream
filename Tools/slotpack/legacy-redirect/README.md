# Older download URLs

This assets-only deployment redirects the old `weights.sevra.page` package
URLs to the exact Hugging Face commit selected by `PinnedTransport.swift`.
New clients go directly to Hugging Face.

Keep `assets.run_worker_first` false, `not_found_handling` set to `404-page`,
and the static `404.html` present. There is no application entrypoint or R2
binding. The `_redirects` file is processed by the static asset service;
it does not proxy model bytes. Cloudflare documents static asset requests as
[free and unlimited](https://developers.cloudflare.com/workers/static-assets/billing-and-limitations/).
Do not replace this with a JavaScript redirect function or a model proxy.

After publishing and qualifying a complete package, update the exact revision
in `_redirects` and deploy with existing account authority:

```sh
wrangler deploy --config Tools/slotpack/legacy-redirect/wrangler.jsonc
```

Keep the hostname's application-Worker exclusion route in place. Its custom
domain must belong to this assets deployment. When migrating an R2 custom
domain, first qualify the `workers.dev` endpoint, detach the R2 domain, attach
this deployment's custom domain, and verify public redirects plus an earlier
released client's missing-file reconstruction. Keep the old objects until
these checks and the complete new-default download pass.

Read back the deployed version: `resources.script_runtime.assets` must have
`serve_directly: true`, `raw_run_worker_first: false`, and the exact redirect;
bindings must be empty. Verify unknown paths return the static 404 page.
