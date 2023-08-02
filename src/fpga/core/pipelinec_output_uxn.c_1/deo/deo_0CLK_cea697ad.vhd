-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 8
entity deo_0CLK_cea697ad is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0));
end deo_0CLK_cea697ad;
architecture arch of deo_0CLK_cea697ad is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal deo_mask : uint16_t_16 := (
0 => to_unsigned(65320, 16),
1 => to_unsigned(768, 16),
2 => to_unsigned(49192, 16),
3 => to_unsigned(32768, 16),
4 => to_unsigned(32768, 16),
5 => to_unsigned(32768, 16),
6 => to_unsigned(32768, 16),
7 => to_unsigned(0, 16),
8 => to_unsigned(0, 16),
9 => to_unsigned(0, 16),
10 => to_unsigned(41568, 16),
11 => to_unsigned(41568, 16),
12 => to_unsigned(0, 16),
13 => to_unsigned(0, 16),
14 => to_unsigned(0, 16),
15 => to_unsigned(0, 16),
others => to_unsigned(0, 16))
;
signal REG_COMB_deo_mask : uint16_t_16;

-- Each function instance gets signals
-- device_ram_write[uxn_device_h_l145_c2_760f]
signal device_ram_write_uxn_device_h_l145_c2_760f_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_write_uxn_device_h_l145_c2_760f_address : unsigned(7 downto 0);
signal device_ram_write_uxn_device_h_l145_c2_760f_value : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l146_c17_49c9]
signal CONST_SR_4_uxn_device_h_l146_c17_49c9_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l146_c17_49c9_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l146_c7_4c1d]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l146_c44_1168]
signal BIN_OP_AND_uxn_device_h_l146_c44_1168_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l146_c44_1168_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l146_c44_1168_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_device_h_l146_c7_bd64]
signal BIN_OP_SR_uxn_device_h_l146_c7_bd64_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_device_h_l146_c7_bd64_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_device_h_l146_c7_bd64_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l146_c7_0e8c]
signal BIN_OP_AND_uxn_device_h_l146_c7_0e8c_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_device_h_l146_c7_0e8c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l146_c7_0e8c_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l146_c1_f62d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_return_output : unsigned(0 downto 0);

-- uxn_deo[uxn_device_h_l147_c3_37b2]
signal uxn_deo_uxn_device_h_l147_c3_37b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal uxn_deo_uxn_device_h_l147_c3_37b2_addr : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- device_ram_write_uxn_device_h_l145_c2_760f
device_ram_write_uxn_device_h_l145_c2_760f : entity work.device_ram_write_0CLK_b45f1687 port map (
clk,
device_ram_write_uxn_device_h_l145_c2_760f_CLOCK_ENABLE,
device_ram_write_uxn_device_h_l145_c2_760f_address,
device_ram_write_uxn_device_h_l145_c2_760f_value);

-- CONST_SR_4_uxn_device_h_l146_c17_49c9
CONST_SR_4_uxn_device_h_l146_c17_49c9 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l146_c17_49c9_x,
CONST_SR_4_uxn_device_h_l146_c17_49c9_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_return_output);

-- BIN_OP_AND_uxn_device_h_l146_c44_1168
BIN_OP_AND_uxn_device_h_l146_c44_1168 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l146_c44_1168_left,
BIN_OP_AND_uxn_device_h_l146_c44_1168_right,
BIN_OP_AND_uxn_device_h_l146_c44_1168_return_output);

-- BIN_OP_SR_uxn_device_h_l146_c7_bd64
BIN_OP_SR_uxn_device_h_l146_c7_bd64 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_device_h_l146_c7_bd64_left,
BIN_OP_SR_uxn_device_h_l146_c7_bd64_right,
BIN_OP_SR_uxn_device_h_l146_c7_bd64_return_output);

-- BIN_OP_AND_uxn_device_h_l146_c7_0e8c
BIN_OP_AND_uxn_device_h_l146_c7_0e8c : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l146_c7_0e8c_left,
BIN_OP_AND_uxn_device_h_l146_c7_0e8c_right,
BIN_OP_AND_uxn_device_h_l146_c7_0e8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_return_output);

-- uxn_deo_uxn_device_h_l147_c3_37b2
uxn_deo_uxn_device_h_l147_c3_37b2 : entity work.uxn_deo_0CLK_dbc15234 port map (
clk,
uxn_deo_uxn_device_h_l147_c3_37b2_CLOCK_ENABLE,
uxn_deo_uxn_device_h_l147_c3_37b2_addr);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 value,
 -- Registers
 deo_mask,
 -- All submodule outputs
 CONST_SR_4_uxn_device_h_l146_c17_49c9_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_return_output,
 BIN_OP_AND_uxn_device_h_l146_c44_1168_return_output,
 BIN_OP_SR_uxn_device_h_l146_c7_bd64_return_output,
 BIN_OP_AND_uxn_device_h_l146_c7_0e8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_device_ram_write_uxn_device_h_l145_c2_760f_address : unsigned(7 downto 0);
 variable VAR_device_ram_write_uxn_device_h_l145_c2_760f_value : unsigned(7 downto 0);
 variable VAR_device_ram_write_uxn_device_h_l145_c2_760f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c2_fb41_interm_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l146_c17_49c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l146_c17_49c9_x : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_return_output : unsigned(15 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iffalse : unsigned(0 downto 0);
 variable VAR_uxn_deo_uxn_device_h_l147_c3_37b2_addr : unsigned(7 downto 0);
 variable VAR_uxn_deo_uxn_device_h_l147_c3_37b2_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_deo_mask : uint16_t_16;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_deo_mask := deo_mask;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_right := to_unsigned(15, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_value := value;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_write_uxn_device_h_l145_c2_760f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_left := VAR_device_address;
     VAR_CONST_SR_4_uxn_device_h_l146_c17_49c9_x := VAR_device_address;
     VAR_device_ram_write_uxn_device_h_l145_c2_760f_address := VAR_device_address;
     VAR_uxn_deo_uxn_device_h_l147_c3_37b2_addr := VAR_device_address;
     VAR_device_ram_write_uxn_device_h_l145_c2_760f_value := VAR_value;
     -- BIN_OP_AND[uxn_device_h_l146_c44_1168] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l146_c44_1168_left <= VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_left;
     BIN_OP_AND_uxn_device_h_l146_c44_1168_right <= VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_return_output := BIN_OP_AND_uxn_device_h_l146_c44_1168_return_output;

     -- device_ram_write[uxn_device_h_l145_c2_760f] LATENCY=0
     -- Clock enable
     device_ram_write_uxn_device_h_l145_c2_760f_CLOCK_ENABLE <= VAR_device_ram_write_uxn_device_h_l145_c2_760f_CLOCK_ENABLE;
     -- Inputs
     device_ram_write_uxn_device_h_l145_c2_760f_address <= VAR_device_ram_write_uxn_device_h_l145_c2_760f_address;
     device_ram_write_uxn_device_h_l145_c2_760f_value <= VAR_device_ram_write_uxn_device_h_l145_c2_760f_value;
     -- Outputs

     -- CONST_SR_4[uxn_device_h_l146_c17_49c9] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l146_c17_49c9_x <= VAR_CONST_SR_4_uxn_device_h_l146_c17_49c9_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l146_c17_49c9_return_output := CONST_SR_4_uxn_device_h_l146_c17_49c9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_right := VAR_BIN_OP_AND_uxn_device_h_l146_c44_1168_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_var_dim_0 := resize(VAR_CONST_SR_4_uxn_device_h_l146_c17_49c9_return_output, 4);
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l146_c7_4c1d] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l146_c7_4c1d_return_output;
     -- BIN_OP_SR[uxn_device_h_l146_c7_bd64] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_device_h_l146_c7_bd64_left <= VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_left;
     BIN_OP_SR_uxn_device_h_l146_c7_bd64_right <= VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_return_output := BIN_OP_SR_uxn_device_h_l146_c7_bd64_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_left := VAR_BIN_OP_SR_uxn_device_h_l146_c7_bd64_return_output;
     -- BIN_OP_AND[uxn_device_h_l146_c7_0e8c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l146_c7_0e8c_left <= VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_left;
     BIN_OP_AND_uxn_device_h_l146_c7_0e8c_right <= VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_return_output := BIN_OP_AND_uxn_device_h_l146_c7_0e8c_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l146_c2_fb41_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l146_c7_0e8c_return_output, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_cond := VAR_MUX_uxn_device_h_l146_c2_fb41_interm_cond;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l146_c1_f62d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_return_output;

     -- Submodule level 5
     VAR_uxn_deo_uxn_device_h_l147_c3_37b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l146_c1_f62d_return_output;
     -- uxn_deo[uxn_device_h_l147_c3_37b2] LATENCY=0
     -- Clock enable
     uxn_deo_uxn_device_h_l147_c3_37b2_CLOCK_ENABLE <= VAR_uxn_deo_uxn_device_h_l147_c3_37b2_CLOCK_ENABLE;
     -- Inputs
     uxn_deo_uxn_device_h_l147_c3_37b2_addr <= VAR_uxn_deo_uxn_device_h_l147_c3_37b2_addr;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_deo_mask <= REG_VAR_deo_mask;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     deo_mask <= REG_COMB_deo_mask;
 end if;
 end if;
end process;

end arch;
