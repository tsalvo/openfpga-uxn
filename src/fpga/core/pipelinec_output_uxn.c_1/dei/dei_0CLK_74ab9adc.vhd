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
-- Submodules: 9
entity dei_0CLK_74ab9adc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 stack_offset : in unsigned(7 downto 0);
 addr : in unsigned(7 downto 0));
end dei_0CLK_74ab9adc;
architecture arch of dei_0CLK_74ab9adc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal dei_mask : uint16_t_16 := (
0 => to_unsigned(0, 16),
1 => to_unsigned(0, 16),
2 => to_unsigned(60, 16),
3 => to_unsigned(20, 16),
4 => to_unsigned(20, 16),
5 => to_unsigned(20, 16),
6 => to_unsigned(20, 16),
7 => to_unsigned(0, 16),
8 => to_unsigned(0, 16),
9 => to_unsigned(0, 16),
10 => to_unsigned(0, 16),
11 => to_unsigned(0, 16),
12 => to_unsigned(2047, 16),
13 => to_unsigned(0, 16),
14 => to_unsigned(0, 16),
15 => to_unsigned(0, 16),
others => to_unsigned(0, 16))
;
signal is_event : unsigned(15 downto 0) := to_unsigned(0, 16);
signal value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_dei_mask : uint16_t_16;
signal REG_COMB_is_event : unsigned(15 downto 0);
signal REG_COMB_value : unsigned(7 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_device_h_l59_c23_4408]
signal CONST_SR_4_uxn_device_h_l59_c23_4408_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l59_c23_4408_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l59_c14_934a]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l59_c39_fe77]
signal BIN_OP_AND_uxn_device_h_l59_c39_fe77_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c39_fe77_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c39_fe77_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_device_h_l59_c14_a58c]
signal BIN_OP_SR_uxn_device_h_l59_c14_a58c_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_device_h_l59_c14_a58c_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_device_h_l59_c14_a58c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l59_c14_68da]
signal BIN_OP_AND_uxn_device_h_l59_c14_68da_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c14_68da_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c14_68da_return_output : unsigned(15 downto 0);

-- uxn_dei[uxn_device_h_l60_c21_0f96]
signal uxn_dei_uxn_device_h_l60_c21_0f96_CLOCK_ENABLE : unsigned(0 downto 0);
signal uxn_dei_uxn_device_h_l60_c21_0f96_addr : unsigned(7 downto 0);
signal uxn_dei_uxn_device_h_l60_c21_0f96_return_output : unsigned(7 downto 0);

-- peek_dev[uxn_device_h_l60_c37_fad1]
signal peek_dev_uxn_device_h_l60_c37_fad1_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l60_c37_fad1_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l60_c37_fad1_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l60_c10_ebba]
signal MUX_uxn_device_h_l60_c10_ebba_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l60_c10_ebba_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l60_c10_ebba_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l60_c10_ebba_return_output : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l61_c2_ccfe]
signal put_stack_uxn_device_h_l61_c2_ccfe_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l61_c2_ccfe_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l61_c2_ccfe_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l61_c2_ccfe_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_4_uxn_device_h_l59_c23_4408
CONST_SR_4_uxn_device_h_l59_c23_4408 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l59_c23_4408_x,
CONST_SR_4_uxn_device_h_l59_c23_4408_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_return_output);

-- BIN_OP_AND_uxn_device_h_l59_c39_fe77
BIN_OP_AND_uxn_device_h_l59_c39_fe77 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l59_c39_fe77_left,
BIN_OP_AND_uxn_device_h_l59_c39_fe77_right,
BIN_OP_AND_uxn_device_h_l59_c39_fe77_return_output);

-- BIN_OP_SR_uxn_device_h_l59_c14_a58c
BIN_OP_SR_uxn_device_h_l59_c14_a58c : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_device_h_l59_c14_a58c_left,
BIN_OP_SR_uxn_device_h_l59_c14_a58c_right,
BIN_OP_SR_uxn_device_h_l59_c14_a58c_return_output);

-- BIN_OP_AND_uxn_device_h_l59_c14_68da
BIN_OP_AND_uxn_device_h_l59_c14_68da : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l59_c14_68da_left,
BIN_OP_AND_uxn_device_h_l59_c14_68da_right,
BIN_OP_AND_uxn_device_h_l59_c14_68da_return_output);

-- uxn_dei_uxn_device_h_l60_c21_0f96
uxn_dei_uxn_device_h_l60_c21_0f96 : entity work.uxn_dei_0CLK_794db3df port map (
clk,
uxn_dei_uxn_device_h_l60_c21_0f96_CLOCK_ENABLE,
uxn_dei_uxn_device_h_l60_c21_0f96_addr,
uxn_dei_uxn_device_h_l60_c21_0f96_return_output);

-- peek_dev_uxn_device_h_l60_c37_fad1
peek_dev_uxn_device_h_l60_c37_fad1 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l60_c37_fad1_CLOCK_ENABLE,
peek_dev_uxn_device_h_l60_c37_fad1_address,
peek_dev_uxn_device_h_l60_c37_fad1_return_output);

-- MUX_uxn_device_h_l60_c10_ebba
MUX_uxn_device_h_l60_c10_ebba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l60_c10_ebba_cond,
MUX_uxn_device_h_l60_c10_ebba_iftrue,
MUX_uxn_device_h_l60_c10_ebba_iffalse,
MUX_uxn_device_h_l60_c10_ebba_return_output);

-- put_stack_uxn_device_h_l61_c2_ccfe
put_stack_uxn_device_h_l61_c2_ccfe : entity work.put_stack_0CLK_12466044 port map (
clk,
put_stack_uxn_device_h_l61_c2_ccfe_CLOCK_ENABLE,
put_stack_uxn_device_h_l61_c2_ccfe_stack_index,
put_stack_uxn_device_h_l61_c2_ccfe_offset,
put_stack_uxn_device_h_l61_c2_ccfe_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 stack_offset,
 addr,
 -- Registers
 dei_mask,
 is_event,
 value,
 -- All submodule outputs
 CONST_SR_4_uxn_device_h_l59_c23_4408_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_return_output,
 BIN_OP_AND_uxn_device_h_l59_c39_fe77_return_output,
 BIN_OP_SR_uxn_device_h_l59_c14_a58c_return_output,
 BIN_OP_AND_uxn_device_h_l59_c14_68da_return_output,
 uxn_dei_uxn_device_h_l60_c21_0f96_return_output,
 peek_dev_uxn_device_h_l60_c37_fad1_return_output,
 MUX_uxn_device_h_l60_c10_ebba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_offset : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_is_event_uxn_device_h_l59_c2_cb56 : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c23_4408_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c23_4408_x : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_ebba_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_ebba_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_ebba_iffalse : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_0f96_addr : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_0f96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_0f96_return_output : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_fad1_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_fad1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_fad1_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_ebba_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_ccfe_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_ccfe_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_ccfe_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_ccfe_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_dei_mask : uint16_t_16;
variable REG_VAR_is_event : unsigned(15 downto 0);
variable REG_VAR_value : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_dei_mask := dei_mask;
  REG_VAR_is_event := is_event;
  REG_VAR_value := value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_right := to_unsigned(15, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_stack_offset := stack_offset;
     VAR_addr := addr;

     -- Submodule level 0
     VAR_peek_dev_uxn_device_h_l60_c37_fad1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_put_stack_uxn_device_h_l61_c2_ccfe_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_dei_uxn_device_h_l60_c21_0f96_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_left := VAR_addr;
     VAR_peek_dev_uxn_device_h_l60_c37_fad1_address := VAR_addr;
     VAR_uxn_dei_uxn_device_h_l60_c21_0f96_addr := VAR_addr;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_ref_toks_0 := dei_mask;
     REG_VAR_dei_mask := dei_mask;
     VAR_put_stack_uxn_device_h_l61_c2_ccfe_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l61_c2_ccfe_offset := VAR_stack_offset;
     VAR_CONST_SR_4_uxn_device_h_l59_c23_4408_x := value;
     -- CONST_SR_4[uxn_device_h_l59_c23_4408] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l59_c23_4408_x <= VAR_CONST_SR_4_uxn_device_h_l59_c23_4408_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l59_c23_4408_return_output := CONST_SR_4_uxn_device_h_l59_c23_4408_return_output;

     -- peek_dev[uxn_device_h_l60_c37_fad1] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l60_c37_fad1_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l60_c37_fad1_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l60_c37_fad1_address <= VAR_peek_dev_uxn_device_h_l60_c37_fad1_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l60_c37_fad1_return_output := peek_dev_uxn_device_h_l60_c37_fad1_return_output;

     -- uxn_dei[uxn_device_h_l60_c21_0f96] LATENCY=0
     -- Clock enable
     uxn_dei_uxn_device_h_l60_c21_0f96_CLOCK_ENABLE <= VAR_uxn_dei_uxn_device_h_l60_c21_0f96_CLOCK_ENABLE;
     -- Inputs
     uxn_dei_uxn_device_h_l60_c21_0f96_addr <= VAR_uxn_dei_uxn_device_h_l60_c21_0f96_addr;
     -- Outputs
     VAR_uxn_dei_uxn_device_h_l60_c21_0f96_return_output := uxn_dei_uxn_device_h_l60_c21_0f96_return_output;

     -- BIN_OP_AND[uxn_device_h_l59_c39_fe77] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l59_c39_fe77_left <= VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_left;
     BIN_OP_AND_uxn_device_h_l59_c39_fe77_right <= VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_return_output := BIN_OP_AND_uxn_device_h_l59_c39_fe77_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_right := VAR_BIN_OP_AND_uxn_device_h_l59_c39_fe77_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_var_dim_0 := resize(VAR_CONST_SR_4_uxn_device_h_l59_c23_4408_return_output, 4);
     VAR_MUX_uxn_device_h_l60_c10_ebba_iffalse := VAR_peek_dev_uxn_device_h_l60_c37_fad1_return_output;
     VAR_MUX_uxn_device_h_l60_c10_ebba_iftrue := VAR_uxn_dei_uxn_device_h_l60_c21_0f96_return_output;
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l59_c14_934a] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_934a_return_output;
     -- BIN_OP_SR[uxn_device_h_l59_c14_a58c] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_device_h_l59_c14_a58c_left <= VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_left;
     BIN_OP_SR_uxn_device_h_l59_c14_a58c_right <= VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_return_output := BIN_OP_SR_uxn_device_h_l59_c14_a58c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_left := VAR_BIN_OP_SR_uxn_device_h_l59_c14_a58c_return_output;
     -- BIN_OP_AND[uxn_device_h_l59_c14_68da] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l59_c14_68da_left <= VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_left;
     BIN_OP_AND_uxn_device_h_l59_c14_68da_right <= VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_return_output := BIN_OP_AND_uxn_device_h_l59_c14_68da_return_output;

     -- Submodule level 4
     VAR_is_event_uxn_device_h_l59_c2_cb56 := VAR_BIN_OP_AND_uxn_device_h_l59_c14_68da_return_output;
     VAR_MUX_uxn_device_h_l60_c10_ebba_cond := resize(VAR_is_event_uxn_device_h_l59_c2_cb56, 1);
     REG_VAR_is_event := VAR_is_event_uxn_device_h_l59_c2_cb56;
     -- MUX[uxn_device_h_l60_c10_ebba] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l60_c10_ebba_cond <= VAR_MUX_uxn_device_h_l60_c10_ebba_cond;
     MUX_uxn_device_h_l60_c10_ebba_iftrue <= VAR_MUX_uxn_device_h_l60_c10_ebba_iftrue;
     MUX_uxn_device_h_l60_c10_ebba_iffalse <= VAR_MUX_uxn_device_h_l60_c10_ebba_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l60_c10_ebba_return_output := MUX_uxn_device_h_l60_c10_ebba_return_output;

     -- Submodule level 5
     VAR_put_stack_uxn_device_h_l61_c2_ccfe_value := VAR_MUX_uxn_device_h_l60_c10_ebba_return_output;
     REG_VAR_value := VAR_MUX_uxn_device_h_l60_c10_ebba_return_output;
     -- put_stack[uxn_device_h_l61_c2_ccfe] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l61_c2_ccfe_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l61_c2_ccfe_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l61_c2_ccfe_stack_index <= VAR_put_stack_uxn_device_h_l61_c2_ccfe_stack_index;
     put_stack_uxn_device_h_l61_c2_ccfe_offset <= VAR_put_stack_uxn_device_h_l61_c2_ccfe_offset;
     put_stack_uxn_device_h_l61_c2_ccfe_value <= VAR_put_stack_uxn_device_h_l61_c2_ccfe_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_dei_mask <= REG_VAR_dei_mask;
REG_COMB_is_event <= REG_VAR_is_event;
REG_COMB_value <= REG_VAR_value;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     dei_mask <= REG_COMB_dei_mask;
     is_event <= REG_COMB_is_event;
     value <= REG_COMB_value;
 end if;
 end if;
end process;

end arch;
