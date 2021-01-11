{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "etlcmd";
  version = "0.3.8";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = pname;
    rev = "v${version}";
    sha256 = "1f8gv51pnj5qll7zfwvz1jscw2j7dw9zhlym86a9nrlng1f33vwg";
  };

  vendorSha256 = "15xcjrkhvqsjybfqz6vgnk4w3hn8lymmg99j1f4yyna4q98fmwfa";

  meta = {
    description = "A utility to assist with the automation of ETL tasks";
    homepage = "https://github.com/samhug/etlcmd";
  };
}
