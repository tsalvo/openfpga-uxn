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
-- Submodules: 17
entity screen_dei_0CLK_f56ba9de is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end screen_dei_0CLK_f56ba9de;
architecture arch of screen_dei_0CLK_f56ba9de is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l329_c6_9f7c]
signal BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l334_c7_e7a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l329_c2_7be4]
signal result_MUX_uxn_device_h_l329_c2_7be4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l329_c2_7be4_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l329_c2_7be4_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l329_c2_7be4_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l334_c11_51b6]
signal BIN_OP_EQ_uxn_device_h_l334_c11_51b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l334_c11_51b6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l339_c7_5d54]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l334_c7_e7a9]
signal result_MUX_uxn_device_h_l334_c7_e7a9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l334_c7_e7a9_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l334_c7_e7a9_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l334_c7_e7a9_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l339_c11_12ae]
signal BIN_OP_EQ_uxn_device_h_l339_c11_12ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c11_12ae_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l344_c7_2e2b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l339_c7_5d54]
signal result_MUX_uxn_device_h_l339_c7_5d54_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l339_c7_5d54_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l339_c7_5d54_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l339_c7_5d54_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l344_c11_a7a8]
signal BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l349_c1_5dbf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l344_c7_2e2b]
signal result_MUX_uxn_device_h_l344_c7_2e2b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l344_c7_2e2b_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l344_c7_2e2b_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l344_c7_2e2b_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l350_c12_97e9]
signal generic_dei_uxn_device_h_l350_c12_97e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l350_c12_97e9_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_97e9_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_97e9_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_97e9_return_output : device_in_result_t;

function CONST_REF_RD_device_in_result_t_device_in_result_t_5662( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base.device_ram_address := ref_toks_0;
      base.dei_value := ref_toks_1;
      base.is_dei_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l329_c6_9f7c
BIN_OP_EQ_uxn_device_h_l329_c6_9f7c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_left,
BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_right,
BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_return_output);

-- result_MUX_uxn_device_h_l329_c2_7be4
result_MUX_uxn_device_h_l329_c2_7be4 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l329_c2_7be4_cond,
result_MUX_uxn_device_h_l329_c2_7be4_iftrue,
result_MUX_uxn_device_h_l329_c2_7be4_iffalse,
result_MUX_uxn_device_h_l329_c2_7be4_return_output);

-- BIN_OP_EQ_uxn_device_h_l334_c11_51b6
BIN_OP_EQ_uxn_device_h_l334_c11_51b6 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l334_c11_51b6_left,
BIN_OP_EQ_uxn_device_h_l334_c11_51b6_right,
BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_return_output);

-- result_MUX_uxn_device_h_l334_c7_e7a9
result_MUX_uxn_device_h_l334_c7_e7a9 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l334_c7_e7a9_cond,
result_MUX_uxn_device_h_l334_c7_e7a9_iftrue,
result_MUX_uxn_device_h_l334_c7_e7a9_iffalse,
result_MUX_uxn_device_h_l334_c7_e7a9_return_output);

-- BIN_OP_EQ_uxn_device_h_l339_c11_12ae
BIN_OP_EQ_uxn_device_h_l339_c11_12ae : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l339_c11_12ae_left,
BIN_OP_EQ_uxn_device_h_l339_c11_12ae_right,
BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_return_output);

-- result_MUX_uxn_device_h_l339_c7_5d54
result_MUX_uxn_device_h_l339_c7_5d54 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l339_c7_5d54_cond,
result_MUX_uxn_device_h_l339_c7_5d54_iftrue,
result_MUX_uxn_device_h_l339_c7_5d54_iffalse,
result_MUX_uxn_device_h_l339_c7_5d54_return_output);

-- BIN_OP_EQ_uxn_device_h_l344_c11_a7a8
BIN_OP_EQ_uxn_device_h_l344_c11_a7a8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_left,
BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_right,
BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_return_output);

-- result_MUX_uxn_device_h_l344_c7_2e2b
result_MUX_uxn_device_h_l344_c7_2e2b : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l344_c7_2e2b_cond,
result_MUX_uxn_device_h_l344_c7_2e2b_iftrue,
result_MUX_uxn_device_h_l344_c7_2e2b_iffalse,
result_MUX_uxn_device_h_l344_c7_2e2b_return_output);

-- generic_dei_uxn_device_h_l350_c12_97e9
generic_dei_uxn_device_h_l350_c12_97e9 : entity work.generic_dei_0CLK_5af1a430 port map (
clk,
generic_dei_uxn_device_h_l350_c12_97e9_CLOCK_ENABLE,
generic_dei_uxn_device_h_l350_c12_97e9_device_address,
generic_dei_uxn_device_h_l350_c12_97e9_phase,
generic_dei_uxn_device_h_l350_c12_97e9_previous_device_ram_read,
generic_dei_uxn_device_h_l350_c12_97e9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_return_output,
 result_MUX_uxn_device_h_l329_c2_7be4_return_output,
 BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_return_output,
 result_MUX_uxn_device_h_l334_c7_e7a9_return_output,
 BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_return_output,
 result_MUX_uxn_device_h_l339_c7_5d54_return_output,
 BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_return_output,
 result_MUX_uxn_device_h_l344_c7_2e2b_return_output,
 generic_dei_uxn_device_h_l350_c12_97e9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l329_c2_7be4_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l329_c2_7be4_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l329_c2_7be4_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l334_c7_e7a9_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l329_c2_7be4_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l329_c2_7be4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l330_c3_c200 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l331_c3_e279 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l334_c7_e7a9_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l334_c7_e7a9_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l334_c7_e7a9_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l339_c7_5d54_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l334_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l335_c3_2031 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l339_c7_5d54_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l339_c7_5d54_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l339_c7_5d54_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l344_c7_2e2b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l339_c7_5d54_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l340_c3_f565 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l341_c3_f670 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l344_c7_2e2b_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l344_c7_2e2b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l344_c7_2e2b_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l344_c7_2e2b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l345_c3_8a95 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l346_c3_cf27 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_97e9_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_97e9_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_97e9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_97e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_97e9_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l335_c3_2031 := resize(to_unsigned(0, 1), 8);
     VAR_result_dei_value_uxn_device_h_l331_c3_e279 := resize(to_unsigned(1, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l345_c3_8a95 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_right := to_unsigned(37, 6);
     VAR_result_device_ram_address_uxn_device_h_l340_c3_f565 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iftrue := to_unsigned(0, 1);
     VAR_result_dei_value_uxn_device_h_l346_c3_cf27 := resize(to_unsigned(104, 7), 8);
     VAR_result_dei_value_uxn_device_h_l341_c3_f670 := resize(to_unsigned(1, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l330_c3_c200 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l329_c2_7be4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l329_c2_7be4_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l330_c3_c200,
     VAR_result_dei_value_uxn_device_h_l331_c3_e279,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l339_c7_5d54] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l339_c7_5d54_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l340_c3_f565,
     VAR_result_dei_value_uxn_device_h_l341_c3_f670,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l334_c7_e7a9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l334_c7_e7a9_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l335_c3_2031,
     to_unsigned(144, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l344_c7_2e2b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l344_c7_2e2b_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l345_c3_8a95,
     VAR_result_dei_value_uxn_device_h_l346_c3_cf27,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l334_c7_e7a9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l334_c7_e7a9_return_output;
     VAR_result_MUX_uxn_device_h_l344_c7_2e2b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l344_c7_2e2b_return_output;
     VAR_result_MUX_uxn_device_h_l339_c7_5d54_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l339_c7_5d54_return_output;
     VAR_result_MUX_uxn_device_h_l329_c2_7be4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l329_c2_7be4_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l350_c12_97e9_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l350_c12_97e9_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l350_c12_97e9_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l329_c6_9f7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_left <= VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_left;
     BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_right <= VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output := BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l344_c11_a7a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_left <= VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_left;
     BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_right <= VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output := BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l334_c11_51b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l334_c11_51b6_left <= VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_left;
     BIN_OP_EQ_uxn_device_h_l334_c11_51b6_right <= VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output := BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l339_c11_12ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l339_c11_12ae_left <= VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_left;
     BIN_OP_EQ_uxn_device_h_l339_c11_12ae_right <= VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output := BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output;
     VAR_result_MUX_uxn_device_h_l329_c2_7be4_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c6_9f7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output;
     VAR_result_MUX_uxn_device_h_l334_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c11_51b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output;
     VAR_result_MUX_uxn_device_h_l339_c7_5d54_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c11_12ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output;
     VAR_result_MUX_uxn_device_h_l344_c7_2e2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c11_a7a8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l334_c7_e7a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_e7a9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l339_c7_5d54] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_5d54_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l344_c7_2e2b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_2e2b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l349_c1_5dbf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_return_output;

     -- Submodule level 5
     VAR_generic_dei_uxn_device_h_l350_c12_97e9_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_5dbf_return_output;
     -- generic_dei[uxn_device_h_l350_c12_97e9] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l350_c12_97e9_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l350_c12_97e9_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l350_c12_97e9_device_address <= VAR_generic_dei_uxn_device_h_l350_c12_97e9_device_address;
     generic_dei_uxn_device_h_l350_c12_97e9_phase <= VAR_generic_dei_uxn_device_h_l350_c12_97e9_phase;
     generic_dei_uxn_device_h_l350_c12_97e9_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l350_c12_97e9_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l350_c12_97e9_return_output := generic_dei_uxn_device_h_l350_c12_97e9_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l344_c7_2e2b_iffalse := VAR_generic_dei_uxn_device_h_l350_c12_97e9_return_output;
     -- result_MUX[uxn_device_h_l344_c7_2e2b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l344_c7_2e2b_cond <= VAR_result_MUX_uxn_device_h_l344_c7_2e2b_cond;
     result_MUX_uxn_device_h_l344_c7_2e2b_iftrue <= VAR_result_MUX_uxn_device_h_l344_c7_2e2b_iftrue;
     result_MUX_uxn_device_h_l344_c7_2e2b_iffalse <= VAR_result_MUX_uxn_device_h_l344_c7_2e2b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l344_c7_2e2b_return_output := result_MUX_uxn_device_h_l344_c7_2e2b_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l339_c7_5d54_iffalse := VAR_result_MUX_uxn_device_h_l344_c7_2e2b_return_output;
     -- result_MUX[uxn_device_h_l339_c7_5d54] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l339_c7_5d54_cond <= VAR_result_MUX_uxn_device_h_l339_c7_5d54_cond;
     result_MUX_uxn_device_h_l339_c7_5d54_iftrue <= VAR_result_MUX_uxn_device_h_l339_c7_5d54_iftrue;
     result_MUX_uxn_device_h_l339_c7_5d54_iffalse <= VAR_result_MUX_uxn_device_h_l339_c7_5d54_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l339_c7_5d54_return_output := result_MUX_uxn_device_h_l339_c7_5d54_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l334_c7_e7a9_iffalse := VAR_result_MUX_uxn_device_h_l339_c7_5d54_return_output;
     -- result_MUX[uxn_device_h_l334_c7_e7a9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l334_c7_e7a9_cond <= VAR_result_MUX_uxn_device_h_l334_c7_e7a9_cond;
     result_MUX_uxn_device_h_l334_c7_e7a9_iftrue <= VAR_result_MUX_uxn_device_h_l334_c7_e7a9_iftrue;
     result_MUX_uxn_device_h_l334_c7_e7a9_iffalse <= VAR_result_MUX_uxn_device_h_l334_c7_e7a9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l334_c7_e7a9_return_output := result_MUX_uxn_device_h_l334_c7_e7a9_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l329_c2_7be4_iffalse := VAR_result_MUX_uxn_device_h_l334_c7_e7a9_return_output;
     -- result_MUX[uxn_device_h_l329_c2_7be4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l329_c2_7be4_cond <= VAR_result_MUX_uxn_device_h_l329_c2_7be4_cond;
     result_MUX_uxn_device_h_l329_c2_7be4_iftrue <= VAR_result_MUX_uxn_device_h_l329_c2_7be4_iftrue;
     result_MUX_uxn_device_h_l329_c2_7be4_iffalse <= VAR_result_MUX_uxn_device_h_l329_c2_7be4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l329_c2_7be4_return_output := result_MUX_uxn_device_h_l329_c2_7be4_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l329_c2_7be4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l329_c2_7be4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
