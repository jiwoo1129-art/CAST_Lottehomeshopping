# L.LIVE 로그인 없는 팀 공동 사이트

1. Supabase SQL Editor에서 schema.sql을 먼저 실행합니다.
2. 이어서 public-access.sql을 실행합니다. 이 설정은 링크를 아는 누구에게나 읽기/수정/삭제 권한을 부여합니다. 민감한 기업 정보는 넣지 마세요.
3. Supabase Project Settings > API에서 Project URL과 publishable/anon key를 복사해 config.js의 자리표시자를 교체합니다. secret/service_role 키는 절대 입력하지 마세요.
4. GitHub 저장소 루트에 index.html, config.js, schema.sql, public-access.sql을 업로드/교체합니다.
5. GitHub Settings > Pages에서 main /(root)를 배포하도록 설정합니다.
6. https://jiwoo1129-art.github.io/CAST_Lottehomeshopping/ 에 접속합니다.

로그인 없이 공동 편집할 수 있지만 공개 접근이므로 보안이 약합니다.
