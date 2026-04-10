-- 🔥 PRIMARY KEY (auto có)
-- users_pkey ON (id)

-- 🔥 AUTH (QUAN TRỌNG NHẤT)
CREATE UNIQUE INDEX idx_users_pi_uid
ON public.users(pi_uid);

-- 🔥 RBAC
CREATE INDEX idx_users_role
ON public.users(role);

-- 🔥 ACTIVE FILTER
CREATE INDEX idx_users_active
ON public.users(is_active);

-- 🔥 SOFT DELETE (CỰC QUAN TRỌNG)
CREATE INDEX idx_users_not_deleted
ON public.users(deleted_at)
WHERE deleted_at IS NULL;

-- 🔥 SORT / LIST USER
CREATE INDEX idx_users_created_at
ON public.users(created_at DESC);

-- 🔥 COMPOSITE (RBAC + ACTIVE) → dùng rất nhiều
CREATE INDEX idx_users_role_active
ON public.users(role, is_active)
WHERE deleted_at IS NULL;
