{...}: {
  programs.nixvim.diagnostic.settings = {
    virtual_text = false;
    severity_sort = true;

    signs = {
      text = {
        "__rawKey__vim.diagnostic.severity.ERROR" = "";
        "__rawKey__vim.diagnostic.severity.WARN" = "";
        "__rawKey__vim.diagnostic.severity.HINT" = "󰌶";
        "__rawKey__vim.diagnostic.severity.INFO" = "";
      };
    };
  };
}
