# L.LIVE 팀 공동 컨택 관리

## 배포 전 준비
1. Supabase에서 프로젝트 생성.
2. SQL Editor에서 `schema.sql` 실행. 마지막의 팀원 이메일 등록 SQL을 실제 이메일로 수정하여 별도 실행.
3. `config.js`에 Supabase Project URL과 publishable/anon key 입력. **service_role/secret key 사용 금지.**
4. Supabase Authentication > Providers에서 Email 로그인 활성화. Authentication > URL Configuration에 배포 사이트 주소를 Site URL 및 Redirect URLs로 등록.
5. `index.html`, `config.js`를 GitHub Pages 또는 Netlify에 올려 정적 사이트 배포.
6. 팀원은 등록된 이메일로 로그인 링크를 받아 로그인. 실시간 업데이트는 Supabase Realtime으로 동작.

## 보안
팀원 이메일 허용 목록은 `team_members` 테이블에 SQL Editor에서만 등록합니다. RLS가 인증된 허용 팀원만 읽고 수정하도록 제한합니다. 배포된 URL만 안다고 데이터에 접근할 수 없습니다. 팀원 모두 수정/삭제 권한이 있으므로 주의하세요. 무료 요금제 한도 및 이메일 전송 제한을 확인하세요.
