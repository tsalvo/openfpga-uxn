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
-- Submodules: 368
entity eval_opcode_phased_0CLK_77aa49b0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_77aa49b0;
architecture arch of eval_opcode_phased_0CLK_77aa49b0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins_a : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal stack_index : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_wait : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(8 downto 0) := to_unsigned(0, 9);
signal previous_stack_read : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_stack_index_flipped => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 4),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 4),
is_ram_write => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal opc_eval_result : eval_opcode_result_t := (
is_waiting => to_unsigned(0, 1),
is_pc_updated => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_ins_a : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_wait : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(8 downto 0);
signal REG_COMB_previous_stack_read : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2865_c10_9eb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c10_8465]
signal MUX_uxn_opcodes_h_l2865_c10_8465_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c10_8465_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c10_8465_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c10_8465_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2866_c8_537c]
signal BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_6419]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_c075]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2872_c2_9b09]
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c2_9b09]
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2872_c48_95ce]
signal brk_uxn_opcodes_h_l2872_c48_95ce_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2872_c48_95ce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_efff]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_2a89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_1f7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_c075]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2873_c40_677b]
signal jci_uxn_opcodes_h_l2873_c40_677b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_677b_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_677b_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_677b_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_677b_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_677b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_93e5]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_dc34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_dc6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_1f7a]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2874_c40_de31]
signal jmi_uxn_opcodes_h_l2874_c40_de31_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_de31_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_de31_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_de31_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_de31_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_9e41]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_f20b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_ab02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_dc6f]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2875_c40_5b65]
signal jsi_uxn_opcodes_h_l2875_c40_5b65_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_5b65_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_5b65_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_5b65_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_5b65_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_be38]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_c233]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_4bfe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_ab02]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2876_c40_1900]
signal lit_uxn_opcodes_h_l2876_c40_1900_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_1900_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_1900_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_1900_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_1900_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_7112]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_c804]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_39b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_4bfe]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2877_c40_c47e]
signal lit2_uxn_opcodes_h_l2877_c40_c47e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_c47e_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_c47e_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_c47e_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_c47e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_8c5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_eb26]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_3b37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_39b0]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2878_c40_b870]
signal lit_uxn_opcodes_h_l2878_c40_b870_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_b870_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_b870_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_b870_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_b870_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_c496]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_847c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_0118]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_3b37]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2879_c40_ab18]
signal lit2_uxn_opcodes_h_l2879_c40_ab18_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_ab18_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_ab18_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_ab18_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_ab18_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_663c]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_5c2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_fcf8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_0118]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2880_c40_6843]
signal inc_uxn_opcodes_h_l2880_c40_6843_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_6843_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_6843_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_6843_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_6843_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_3d4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_4694]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_86d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_fcf8]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2881_c40_85e8]
signal inc2_uxn_opcodes_h_l2881_c40_85e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_85e8_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_85e8_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_85e8_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_85e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_c2bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_9be6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_f88f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_86d7]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2882_c40_9bb6]
signal pop_uxn_opcodes_h_l2882_c40_9bb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_9bb6_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_9bb6_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_9bb6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_ee4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_5b58]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_9d54]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_f88f]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2883_c40_7c0c]
signal pop2_uxn_opcodes_h_l2883_c40_7c0c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_7c0c_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_7c0c_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_7c0c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_17f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_c864]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_7a00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_9d54]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2884_c40_e8b5]
signal nip_uxn_opcodes_h_l2884_c40_e8b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_e8b5_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_e8b5_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_e8b5_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_e8b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_0aca]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_51c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_78c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_7a00]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2885_c40_6bb2]
signal nip2_uxn_opcodes_h_l2885_c40_6bb2_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_6bb2_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_6bb2_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_6bb2_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_6bb2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_6802]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_6fb7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_22b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_78c1]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2886_c40_ec11]
signal swp_uxn_opcodes_h_l2886_c40_ec11_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_ec11_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_ec11_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_ec11_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_ec11_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_2004]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_a304]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_97cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_22b2]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2887_c40_6743]
signal swp2_uxn_opcodes_h_l2887_c40_6743_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_6743_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_6743_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_6743_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_6743_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_c1e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_0810]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_0a06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_97cf]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2888_c40_8292]
signal rot_uxn_opcodes_h_l2888_c40_8292_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_8292_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_8292_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_8292_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_8292_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_d47b]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_988b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_2c67]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_0a06]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2889_c40_a7c6]
signal rot2_uxn_opcodes_h_l2889_c40_a7c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_a7c6_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_a7c6_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_a7c6_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_a7c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_063f]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_d212]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_e234]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_2c67]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2890_c40_46c6]
signal dup_uxn_opcodes_h_l2890_c40_46c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_46c6_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_46c6_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_46c6_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_46c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_486d]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_e54f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_23f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_e234]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2891_c40_400a]
signal dup2_uxn_opcodes_h_l2891_c40_400a_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_400a_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_400a_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_400a_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_400a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_4d73]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_1234]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_2c37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_23f6]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2892_c40_961b]
signal ovr_uxn_opcodes_h_l2892_c40_961b_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_961b_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_961b_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_961b_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_961b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_c3bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_3016]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_3334]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_2c37]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2893_c40_1de2]
signal ovr2_uxn_opcodes_h_l2893_c40_1de2_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_1de2_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_1de2_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_1de2_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_1de2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_c17d]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_533f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_2b56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_3334]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2894_c40_4448]
signal equ_uxn_opcodes_h_l2894_c40_4448_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_4448_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_4448_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_4448_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_4448_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_f053]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_bad4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_1697]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_2b56]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2895_c40_b755]
signal equ2_uxn_opcodes_h_l2895_c40_b755_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_b755_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_b755_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_b755_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_b755_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_0d76]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_4169]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_b5d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_1697]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2896_c40_76a5]
signal neq_uxn_opcodes_h_l2896_c40_76a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_76a5_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_76a5_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_76a5_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_76a5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_a2b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_5bfc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_9668]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_b5d1]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2897_c40_3b32]
signal neq2_uxn_opcodes_h_l2897_c40_3b32_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_3b32_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_3b32_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_3b32_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_3b32_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_e848]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_5ea9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_ef42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_9668]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2898_c40_3582]
signal gth_uxn_opcodes_h_l2898_c40_3582_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_3582_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_3582_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_3582_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_3582_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_ffbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_4b7d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_1a20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_ef42]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2899_c40_6f72]
signal gth2_uxn_opcodes_h_l2899_c40_6f72_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_6f72_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_6f72_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_6f72_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_6f72_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_d02c]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_3dc4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_b6d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_1a20]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2900_c40_ff91]
signal lth_uxn_opcodes_h_l2900_c40_ff91_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ff91_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ff91_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ff91_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ff91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_5ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_3be8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_e62e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_b6d0]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2901_c40_5d3d]
signal lth2_uxn_opcodes_h_l2901_c40_5d3d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_5d3d_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_5d3d_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_5d3d_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_5d3d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_ef59]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_8b7c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_657e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_e62e]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2902_c40_0e1d]
signal jmp_uxn_opcodes_h_l2902_c40_0e1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_0e1d_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_0e1d_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_0e1d_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_0e1d_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_0e1d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_ea6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_a04f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_8107]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_657e]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2903_c40_a7db]
signal jmp2_uxn_opcodes_h_l2903_c40_a7db_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_a7db_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_a7db_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_a7db_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_a7db_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_2269]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_85f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0a1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_8107]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2904_c40_47a4]
signal jcn_uxn_opcodes_h_l2904_c40_47a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_47a4_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_47a4_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_47a4_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_47a4_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_47a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_0a1d]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_5781]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_4a69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_0a1f]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2905_c40_7f93]
signal jcn2_uxn_opcodes_h_l2905_c40_7f93_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_7f93_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_7f93_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_7f93_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_7f93_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_fc9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_c8de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_3694]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_4a69]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2906_c40_a423]
signal jsr_uxn_opcodes_h_l2906_c40_a423_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_a423_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_a423_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_a423_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_a423_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_a423_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_625c]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_dfdf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_2e01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_3694]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2907_c40_4e6f]
signal jsr2_uxn_opcodes_h_l2907_c40_4e6f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_4e6f_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_4e6f_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_4e6f_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_4e6f_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_4e6f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_176a]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_14de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_e71f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_2e01]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2908_c40_bf35]
signal sth_uxn_opcodes_h_l2908_c40_bf35_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_bf35_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_bf35_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_bf35_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_bf35_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_2aa0]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_1566]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_baa1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_e71f]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2909_c40_f4c3]
signal sth2_uxn_opcodes_h_l2909_c40_f4c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_f4c3_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_f4c3_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_f4c3_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_f4c3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_8716]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_abd1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_441a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_baa1]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2910_c40_5852]
signal ldz_uxn_opcodes_h_l2910_c40_5852_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_5852_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_5852_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_5852_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_5852_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_5852_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_b477]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_6ded]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_e3ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_441a]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2911_c40_4580]
signal ldz2_uxn_opcodes_h_l2911_c40_4580_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_4580_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_4580_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_4580_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_4580_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_4580_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_c4f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_4370]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_f183]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_e3ca]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2912_c40_7886]
signal stz_uxn_opcodes_h_l2912_c40_7886_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_7886_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_7886_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_7886_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_7886_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_dc29]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_de6c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_99a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_f183]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2913_c40_552e]
signal stz2_uxn_opcodes_h_l2913_c40_552e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_552e_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_552e_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_552e_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_552e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_3cce]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_8f56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_710d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_99a9]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2914_c40_33f4]
signal ldr_uxn_opcodes_h_l2914_c40_33f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_33f4_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_33f4_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_33f4_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_33f4_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_33f4_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_33f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_b694]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_a761]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_02a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_710d]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2915_c40_018f]
signal ldr2_uxn_opcodes_h_l2915_c40_018f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_018f_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_018f_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_018f_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_018f_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_018f_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_018f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_25cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_c4ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_dbce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_02a6]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2916_c40_3c55]
signal str1_uxn_opcodes_h_l2916_c40_3c55_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_3c55_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_3c55_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_3c55_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_3c55_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_3c55_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_5f89]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_a132]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8a8e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_dbce]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2917_c40_2109]
signal str2_uxn_opcodes_h_l2917_c40_2109_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_2109_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_2109_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_2109_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_2109_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_2109_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_d015]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_75a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_64d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_8a8e]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2918_c40_c0da]
signal lda_uxn_opcodes_h_l2918_c40_c0da_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_c0da_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_c0da_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_c0da_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_c0da_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_c0da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_7d3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_d24b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_c34a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_64d0]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2919_c40_882a]
signal lda2_uxn_opcodes_h_l2919_c40_882a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_882a_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_882a_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_882a_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_882a_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_882a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_a078]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_632e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_ecea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_c34a]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2920_c40_cb83]
signal sta_uxn_opcodes_h_l2920_c40_cb83_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_cb83_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_cb83_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_cb83_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_cb83_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_bbc7]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_4b5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_940b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_ecea]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2921_c40_c7d0]
signal sta2_uxn_opcodes_h_l2921_c40_c7d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_c7d0_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_c7d0_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_c7d0_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_c7d0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_ec71]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_a273]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_2925]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_940b]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2922_c40_63e9]
signal dei_uxn_opcodes_h_l2922_c40_63e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_controller0_buttons : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr0 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr1 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_63e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_3f5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_111d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_ab74]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_2925]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2923_c40_10cf]
signal dei2_uxn_opcodes_h_l2923_c40_10cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_controller0_buttons : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr0 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr1 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_10cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_d0aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_d262]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_9e97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_ab74]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2924_c40_9287]
signal deo_uxn_opcodes_h_l2924_c40_9287_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_9287_phase : unsigned(11 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_9287_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_9287_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_9287_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_9287_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_9287_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_0ded]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_253c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_1f88]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_9e97]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2925_c40_beda]
signal deo2_uxn_opcodes_h_l2925_c40_beda_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_beda_phase : unsigned(11 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_beda_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_beda_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_beda_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_beda_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_beda_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_612e]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_c87c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_d469]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_1f88]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2926_c40_e989]
signal add_uxn_opcodes_h_l2926_c40_e989_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2926_c40_e989_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_e989_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_e989_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_e989_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_3fde]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_4846]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_861d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_d469]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2927_c40_f98d]
signal add2_uxn_opcodes_h_l2927_c40_f98d_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_f98d_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_f98d_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_f98d_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_f98d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_9c42]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_05d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_be48]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_861d]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_return_output : opcode_result_t;

-- sub1[uxn_opcodes_h_l2928_c40_698d]
signal sub1_uxn_opcodes_h_l2928_c40_698d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_698d_phase : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_698d_ins : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_698d_previous_stack_read : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_698d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_9c48]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_c3b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_80f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_be48]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2929_c40_ac6a]
signal sub2_uxn_opcodes_h_l2929_c40_ac6a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_ac6a_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_ac6a_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_ac6a_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_ac6a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c944]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_dd7a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_2738]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_80f9]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2930_c40_e9da]
signal mul_uxn_opcodes_h_l2930_c40_e9da_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_e9da_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_e9da_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_e9da_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_e9da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_d347]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_5a33]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_e649]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_2738]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2931_c40_c686]
signal mul2_uxn_opcodes_h_l2931_c40_c686_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_c686_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_c686_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_c686_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_c686_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_5c60]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_c7f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_6315]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_e649]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2932_c40_ace9]
signal div_uxn_opcodes_h_l2932_c40_ace9_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2932_c40_ace9_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_ace9_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_ace9_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_ace9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_8992]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_7fc7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_584a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_6315]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2933_c40_6f87]
signal div2_uxn_opcodes_h_l2933_c40_6f87_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_6f87_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_6f87_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_6f87_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_6f87_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_fdcc]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_2ae0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_803c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_584a]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2934_c40_68ed]
signal and_uxn_opcodes_h_l2934_c40_68ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2934_c40_68ed_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_68ed_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_68ed_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_68ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_1940]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_9551]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_c8d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_803c]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2935_c40_ebb9]
signal and2_uxn_opcodes_h_l2935_c40_ebb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_ebb9_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_ebb9_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_ebb9_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_ebb9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_6b38]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_d2af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_342d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_c8d0]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2936_c40_342d]
signal ora_uxn_opcodes_h_l2936_c40_342d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_342d_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_342d_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_342d_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_342d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1745]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_8325]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_8cea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_342d]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2937_c40_43d2]
signal ora2_uxn_opcodes_h_l2937_c40_43d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_43d2_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_43d2_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_43d2_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_43d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_81fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_243b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_2717]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_8cea]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2938_c40_18e9]
signal eor_uxn_opcodes_h_l2938_c40_18e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_18e9_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_18e9_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_18e9_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_18e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_50b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_610c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_4fc2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_2717]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2939_c40_58dd]
signal eor2_uxn_opcodes_h_l2939_c40_58dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_58dd_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_58dd_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_58dd_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_58dd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_dc17]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_2954]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_e399]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_4fc2]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2940_c40_78aa]
signal sft_uxn_opcodes_h_l2940_c40_78aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_78aa_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_78aa_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_78aa_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_78aa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_221e]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_6f38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_e399]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2941_c40_8221]
signal sft2_uxn_opcodes_h_l2941_c40_8221_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_8221_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_8221_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_8221_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_8221_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2943_c16_5c31]
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_a95c]
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2946_c2_b109]
signal sp0_MUX_uxn_opcodes_h_l2946_c2_b109_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2946_c2_b109]
signal sp1_MUX_uxn_opcodes_h_l2946_c2_b109_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_dacc]
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_1da1]
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2952_c29_9993]
signal MUX_uxn_opcodes_h_l2952_c29_9993_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_9993_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_9993_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_9993_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_02c3]
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2953_c20_c6e0]
signal MUX_uxn_opcodes_h_l2953_c20_c6e0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_c6e0_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_c6e0_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_c6e0_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2953_c2_a3cb]
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2955_c24_dd8c]
signal stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_return_output : unsigned(7 downto 0);

function uint8_4_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(4 downto 0)));
return return_output;
end function;

function CAST_TO_uint9_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_uint9_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_int8_t_int4_t( rhs : signed) return signed is

  --variable rhs : signed(3 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return eval_opcode_result_t is
 
  variable base : eval_opcode_result_t; 
  variable return_output : eval_opcode_result_t;
begin
      base.is_waiting := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_return_output);

-- MUX_uxn_opcodes_h_l2865_c10_8465
MUX_uxn_opcodes_h_l2865_c10_8465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c10_8465_cond,
MUX_uxn_opcodes_h_l2865_c10_8465_iftrue,
MUX_uxn_opcodes_h_l2865_c10_8465_iffalse,
MUX_uxn_opcodes_h_l2865_c10_8465_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c
BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_left,
BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_right,
BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09
is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_cond,
is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue,
is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse,
is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09
opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output);

-- brk_uxn_opcodes_h_l2872_c48_95ce
brk_uxn_opcodes_h_l2872_c48_95ce : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2872_c48_95ce_phase,
brk_uxn_opcodes_h_l2872_c48_95ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_c075
opc_result_MUX_uxn_opcodes_h_l2873_c7_c075 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_return_output);

-- jci_uxn_opcodes_h_l2873_c40_677b
jci_uxn_opcodes_h_l2873_c40_677b : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2873_c40_677b_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2873_c40_677b_phase,
jci_uxn_opcodes_h_l2873_c40_677b_pc,
jci_uxn_opcodes_h_l2873_c40_677b_previous_stack_read,
jci_uxn_opcodes_h_l2873_c40_677b_previous_ram_read,
jci_uxn_opcodes_h_l2873_c40_677b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a
opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output);

-- jmi_uxn_opcodes_h_l2874_c40_de31
jmi_uxn_opcodes_h_l2874_c40_de31 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2874_c40_de31_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2874_c40_de31_phase,
jmi_uxn_opcodes_h_l2874_c40_de31_pc,
jmi_uxn_opcodes_h_l2874_c40_de31_previous_ram_read,
jmi_uxn_opcodes_h_l2874_c40_de31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f
opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output);

-- jsi_uxn_opcodes_h_l2875_c40_5b65
jsi_uxn_opcodes_h_l2875_c40_5b65 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2875_c40_5b65_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2875_c40_5b65_phase,
jsi_uxn_opcodes_h_l2875_c40_5b65_pc,
jsi_uxn_opcodes_h_l2875_c40_5b65_previous_ram_read,
jsi_uxn_opcodes_h_l2875_c40_5b65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02
opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output);

-- lit_uxn_opcodes_h_l2876_c40_1900
lit_uxn_opcodes_h_l2876_c40_1900 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2876_c40_1900_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2876_c40_1900_phase,
lit_uxn_opcodes_h_l2876_c40_1900_pc,
lit_uxn_opcodes_h_l2876_c40_1900_previous_ram_read,
lit_uxn_opcodes_h_l2876_c40_1900_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe
opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output);

-- lit2_uxn_opcodes_h_l2877_c40_c47e
lit2_uxn_opcodes_h_l2877_c40_c47e : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2877_c40_c47e_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2877_c40_c47e_phase,
lit2_uxn_opcodes_h_l2877_c40_c47e_pc,
lit2_uxn_opcodes_h_l2877_c40_c47e_previous_ram_read,
lit2_uxn_opcodes_h_l2877_c40_c47e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0
opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output);

-- lit_uxn_opcodes_h_l2878_c40_b870
lit_uxn_opcodes_h_l2878_c40_b870 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2878_c40_b870_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2878_c40_b870_phase,
lit_uxn_opcodes_h_l2878_c40_b870_pc,
lit_uxn_opcodes_h_l2878_c40_b870_previous_ram_read,
lit_uxn_opcodes_h_l2878_c40_b870_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37
opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output);

-- lit2_uxn_opcodes_h_l2879_c40_ab18
lit2_uxn_opcodes_h_l2879_c40_ab18 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2879_c40_ab18_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2879_c40_ab18_phase,
lit2_uxn_opcodes_h_l2879_c40_ab18_pc,
lit2_uxn_opcodes_h_l2879_c40_ab18_previous_ram_read,
lit2_uxn_opcodes_h_l2879_c40_ab18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_0118
opc_result_MUX_uxn_opcodes_h_l2880_c7_0118 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_return_output);

-- inc_uxn_opcodes_h_l2880_c40_6843
inc_uxn_opcodes_h_l2880_c40_6843 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2880_c40_6843_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2880_c40_6843_phase,
inc_uxn_opcodes_h_l2880_c40_6843_ins,
inc_uxn_opcodes_h_l2880_c40_6843_previous_stack_read,
inc_uxn_opcodes_h_l2880_c40_6843_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8
opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output);

-- inc2_uxn_opcodes_h_l2881_c40_85e8
inc2_uxn_opcodes_h_l2881_c40_85e8 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2881_c40_85e8_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2881_c40_85e8_phase,
inc2_uxn_opcodes_h_l2881_c40_85e8_ins,
inc2_uxn_opcodes_h_l2881_c40_85e8_previous_stack_read,
inc2_uxn_opcodes_h_l2881_c40_85e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7
opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output);

-- pop_uxn_opcodes_h_l2882_c40_9bb6
pop_uxn_opcodes_h_l2882_c40_9bb6 : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2882_c40_9bb6_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2882_c40_9bb6_phase,
pop_uxn_opcodes_h_l2882_c40_9bb6_ins,
pop_uxn_opcodes_h_l2882_c40_9bb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f
opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output);

-- pop2_uxn_opcodes_h_l2883_c40_7c0c
pop2_uxn_opcodes_h_l2883_c40_7c0c : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2883_c40_7c0c_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2883_c40_7c0c_phase,
pop2_uxn_opcodes_h_l2883_c40_7c0c_ins,
pop2_uxn_opcodes_h_l2883_c40_7c0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54
opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output);

-- nip_uxn_opcodes_h_l2884_c40_e8b5
nip_uxn_opcodes_h_l2884_c40_e8b5 : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2884_c40_e8b5_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2884_c40_e8b5_phase,
nip_uxn_opcodes_h_l2884_c40_e8b5_ins,
nip_uxn_opcodes_h_l2884_c40_e8b5_previous_stack_read,
nip_uxn_opcodes_h_l2884_c40_e8b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00
opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output);

-- nip2_uxn_opcodes_h_l2885_c40_6bb2
nip2_uxn_opcodes_h_l2885_c40_6bb2 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2885_c40_6bb2_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2885_c40_6bb2_phase,
nip2_uxn_opcodes_h_l2885_c40_6bb2_ins,
nip2_uxn_opcodes_h_l2885_c40_6bb2_previous_stack_read,
nip2_uxn_opcodes_h_l2885_c40_6bb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1
opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output);

-- swp_uxn_opcodes_h_l2886_c40_ec11
swp_uxn_opcodes_h_l2886_c40_ec11 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2886_c40_ec11_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2886_c40_ec11_phase,
swp_uxn_opcodes_h_l2886_c40_ec11_ins,
swp_uxn_opcodes_h_l2886_c40_ec11_previous_stack_read,
swp_uxn_opcodes_h_l2886_c40_ec11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2
opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output);

-- swp2_uxn_opcodes_h_l2887_c40_6743
swp2_uxn_opcodes_h_l2887_c40_6743 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2887_c40_6743_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2887_c40_6743_phase,
swp2_uxn_opcodes_h_l2887_c40_6743_ins,
swp2_uxn_opcodes_h_l2887_c40_6743_previous_stack_read,
swp2_uxn_opcodes_h_l2887_c40_6743_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf
opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output);

-- rot_uxn_opcodes_h_l2888_c40_8292
rot_uxn_opcodes_h_l2888_c40_8292 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2888_c40_8292_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2888_c40_8292_phase,
rot_uxn_opcodes_h_l2888_c40_8292_ins,
rot_uxn_opcodes_h_l2888_c40_8292_previous_stack_read,
rot_uxn_opcodes_h_l2888_c40_8292_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06
opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output);

-- rot2_uxn_opcodes_h_l2889_c40_a7c6
rot2_uxn_opcodes_h_l2889_c40_a7c6 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2889_c40_a7c6_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2889_c40_a7c6_phase,
rot2_uxn_opcodes_h_l2889_c40_a7c6_ins,
rot2_uxn_opcodes_h_l2889_c40_a7c6_previous_stack_read,
rot2_uxn_opcodes_h_l2889_c40_a7c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67
opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output);

-- dup_uxn_opcodes_h_l2890_c40_46c6
dup_uxn_opcodes_h_l2890_c40_46c6 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2890_c40_46c6_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2890_c40_46c6_phase,
dup_uxn_opcodes_h_l2890_c40_46c6_ins,
dup_uxn_opcodes_h_l2890_c40_46c6_previous_stack_read,
dup_uxn_opcodes_h_l2890_c40_46c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_e234
opc_result_MUX_uxn_opcodes_h_l2891_c7_e234 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_return_output);

-- dup2_uxn_opcodes_h_l2891_c40_400a
dup2_uxn_opcodes_h_l2891_c40_400a : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2891_c40_400a_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2891_c40_400a_phase,
dup2_uxn_opcodes_h_l2891_c40_400a_ins,
dup2_uxn_opcodes_h_l2891_c40_400a_previous_stack_read,
dup2_uxn_opcodes_h_l2891_c40_400a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6
opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output);

-- ovr_uxn_opcodes_h_l2892_c40_961b
ovr_uxn_opcodes_h_l2892_c40_961b : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2892_c40_961b_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2892_c40_961b_phase,
ovr_uxn_opcodes_h_l2892_c40_961b_ins,
ovr_uxn_opcodes_h_l2892_c40_961b_previous_stack_read,
ovr_uxn_opcodes_h_l2892_c40_961b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37
opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output);

-- ovr2_uxn_opcodes_h_l2893_c40_1de2
ovr2_uxn_opcodes_h_l2893_c40_1de2 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2893_c40_1de2_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2893_c40_1de2_phase,
ovr2_uxn_opcodes_h_l2893_c40_1de2_ins,
ovr2_uxn_opcodes_h_l2893_c40_1de2_previous_stack_read,
ovr2_uxn_opcodes_h_l2893_c40_1de2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_3334
opc_result_MUX_uxn_opcodes_h_l2894_c7_3334 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_return_output);

-- equ_uxn_opcodes_h_l2894_c40_4448
equ_uxn_opcodes_h_l2894_c40_4448 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2894_c40_4448_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2894_c40_4448_phase,
equ_uxn_opcodes_h_l2894_c40_4448_ins,
equ_uxn_opcodes_h_l2894_c40_4448_previous_stack_read,
equ_uxn_opcodes_h_l2894_c40_4448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56
opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output);

-- equ2_uxn_opcodes_h_l2895_c40_b755
equ2_uxn_opcodes_h_l2895_c40_b755 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2895_c40_b755_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2895_c40_b755_phase,
equ2_uxn_opcodes_h_l2895_c40_b755_ins,
equ2_uxn_opcodes_h_l2895_c40_b755_previous_stack_read,
equ2_uxn_opcodes_h_l2895_c40_b755_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_1697
opc_result_MUX_uxn_opcodes_h_l2896_c7_1697 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_return_output);

-- neq_uxn_opcodes_h_l2896_c40_76a5
neq_uxn_opcodes_h_l2896_c40_76a5 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2896_c40_76a5_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2896_c40_76a5_phase,
neq_uxn_opcodes_h_l2896_c40_76a5_ins,
neq_uxn_opcodes_h_l2896_c40_76a5_previous_stack_read,
neq_uxn_opcodes_h_l2896_c40_76a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1
opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output);

-- neq2_uxn_opcodes_h_l2897_c40_3b32
neq2_uxn_opcodes_h_l2897_c40_3b32 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2897_c40_3b32_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2897_c40_3b32_phase,
neq2_uxn_opcodes_h_l2897_c40_3b32_ins,
neq2_uxn_opcodes_h_l2897_c40_3b32_previous_stack_read,
neq2_uxn_opcodes_h_l2897_c40_3b32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_9668
opc_result_MUX_uxn_opcodes_h_l2898_c7_9668 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_return_output);

-- gth_uxn_opcodes_h_l2898_c40_3582
gth_uxn_opcodes_h_l2898_c40_3582 : entity work.gth_0CLK_441a128d port map (
clk,
gth_uxn_opcodes_h_l2898_c40_3582_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2898_c40_3582_phase,
gth_uxn_opcodes_h_l2898_c40_3582_ins,
gth_uxn_opcodes_h_l2898_c40_3582_previous_stack_read,
gth_uxn_opcodes_h_l2898_c40_3582_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42
opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output);

-- gth2_uxn_opcodes_h_l2899_c40_6f72
gth2_uxn_opcodes_h_l2899_c40_6f72 : entity work.gth2_0CLK_977cbcae port map (
clk,
gth2_uxn_opcodes_h_l2899_c40_6f72_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2899_c40_6f72_phase,
gth2_uxn_opcodes_h_l2899_c40_6f72_ins,
gth2_uxn_opcodes_h_l2899_c40_6f72_previous_stack_read,
gth2_uxn_opcodes_h_l2899_c40_6f72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20
opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output);

-- lth_uxn_opcodes_h_l2900_c40_ff91
lth_uxn_opcodes_h_l2900_c40_ff91 : entity work.lth_0CLK_441a128d port map (
clk,
lth_uxn_opcodes_h_l2900_c40_ff91_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2900_c40_ff91_phase,
lth_uxn_opcodes_h_l2900_c40_ff91_ins,
lth_uxn_opcodes_h_l2900_c40_ff91_previous_stack_read,
lth_uxn_opcodes_h_l2900_c40_ff91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0
opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output);

-- lth2_uxn_opcodes_h_l2901_c40_5d3d
lth2_uxn_opcodes_h_l2901_c40_5d3d : entity work.lth2_0CLK_977cbcae port map (
clk,
lth2_uxn_opcodes_h_l2901_c40_5d3d_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2901_c40_5d3d_phase,
lth2_uxn_opcodes_h_l2901_c40_5d3d_ins,
lth2_uxn_opcodes_h_l2901_c40_5d3d_previous_stack_read,
lth2_uxn_opcodes_h_l2901_c40_5d3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e
opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output);

-- jmp_uxn_opcodes_h_l2902_c40_0e1d
jmp_uxn_opcodes_h_l2902_c40_0e1d : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2902_c40_0e1d_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2902_c40_0e1d_phase,
jmp_uxn_opcodes_h_l2902_c40_0e1d_ins,
jmp_uxn_opcodes_h_l2902_c40_0e1d_pc,
jmp_uxn_opcodes_h_l2902_c40_0e1d_previous_stack_read,
jmp_uxn_opcodes_h_l2902_c40_0e1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_657e
opc_result_MUX_uxn_opcodes_h_l2903_c7_657e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_return_output);

-- jmp2_uxn_opcodes_h_l2903_c40_a7db
jmp2_uxn_opcodes_h_l2903_c40_a7db : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2903_c40_a7db_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2903_c40_a7db_phase,
jmp2_uxn_opcodes_h_l2903_c40_a7db_ins,
jmp2_uxn_opcodes_h_l2903_c40_a7db_previous_stack_read,
jmp2_uxn_opcodes_h_l2903_c40_a7db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_8107
opc_result_MUX_uxn_opcodes_h_l2904_c7_8107 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_return_output);

-- jcn_uxn_opcodes_h_l2904_c40_47a4
jcn_uxn_opcodes_h_l2904_c40_47a4 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2904_c40_47a4_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2904_c40_47a4_phase,
jcn_uxn_opcodes_h_l2904_c40_47a4_ins,
jcn_uxn_opcodes_h_l2904_c40_47a4_pc,
jcn_uxn_opcodes_h_l2904_c40_47a4_previous_stack_read,
jcn_uxn_opcodes_h_l2904_c40_47a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f
opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output);

-- jcn2_uxn_opcodes_h_l2905_c40_7f93
jcn2_uxn_opcodes_h_l2905_c40_7f93 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2905_c40_7f93_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2905_c40_7f93_phase,
jcn2_uxn_opcodes_h_l2905_c40_7f93_ins,
jcn2_uxn_opcodes_h_l2905_c40_7f93_previous_stack_read,
jcn2_uxn_opcodes_h_l2905_c40_7f93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69
opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output);

-- jsr_uxn_opcodes_h_l2906_c40_a423
jsr_uxn_opcodes_h_l2906_c40_a423 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2906_c40_a423_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2906_c40_a423_phase,
jsr_uxn_opcodes_h_l2906_c40_a423_ins,
jsr_uxn_opcodes_h_l2906_c40_a423_pc,
jsr_uxn_opcodes_h_l2906_c40_a423_previous_stack_read,
jsr_uxn_opcodes_h_l2906_c40_a423_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_3694
opc_result_MUX_uxn_opcodes_h_l2907_c7_3694 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_return_output);

-- jsr2_uxn_opcodes_h_l2907_c40_4e6f
jsr2_uxn_opcodes_h_l2907_c40_4e6f : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2907_c40_4e6f_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2907_c40_4e6f_phase,
jsr2_uxn_opcodes_h_l2907_c40_4e6f_ins,
jsr2_uxn_opcodes_h_l2907_c40_4e6f_pc,
jsr2_uxn_opcodes_h_l2907_c40_4e6f_previous_stack_read,
jsr2_uxn_opcodes_h_l2907_c40_4e6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01
opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output);

-- sth_uxn_opcodes_h_l2908_c40_bf35
sth_uxn_opcodes_h_l2908_c40_bf35 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2908_c40_bf35_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2908_c40_bf35_phase,
sth_uxn_opcodes_h_l2908_c40_bf35_ins,
sth_uxn_opcodes_h_l2908_c40_bf35_previous_stack_read,
sth_uxn_opcodes_h_l2908_c40_bf35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f
opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output);

-- sth2_uxn_opcodes_h_l2909_c40_f4c3
sth2_uxn_opcodes_h_l2909_c40_f4c3 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2909_c40_f4c3_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2909_c40_f4c3_phase,
sth2_uxn_opcodes_h_l2909_c40_f4c3_ins,
sth2_uxn_opcodes_h_l2909_c40_f4c3_previous_stack_read,
sth2_uxn_opcodes_h_l2909_c40_f4c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1
opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output);

-- ldz_uxn_opcodes_h_l2910_c40_5852
ldz_uxn_opcodes_h_l2910_c40_5852 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2910_c40_5852_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2910_c40_5852_phase,
ldz_uxn_opcodes_h_l2910_c40_5852_ins,
ldz_uxn_opcodes_h_l2910_c40_5852_previous_stack_read,
ldz_uxn_opcodes_h_l2910_c40_5852_previous_ram_read,
ldz_uxn_opcodes_h_l2910_c40_5852_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_441a
opc_result_MUX_uxn_opcodes_h_l2911_c7_441a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_return_output);

-- ldz2_uxn_opcodes_h_l2911_c40_4580
ldz2_uxn_opcodes_h_l2911_c40_4580 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2911_c40_4580_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2911_c40_4580_phase,
ldz2_uxn_opcodes_h_l2911_c40_4580_ins,
ldz2_uxn_opcodes_h_l2911_c40_4580_previous_stack_read,
ldz2_uxn_opcodes_h_l2911_c40_4580_previous_ram_read,
ldz2_uxn_opcodes_h_l2911_c40_4580_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca
opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output);

-- stz_uxn_opcodes_h_l2912_c40_7886
stz_uxn_opcodes_h_l2912_c40_7886 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2912_c40_7886_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2912_c40_7886_phase,
stz_uxn_opcodes_h_l2912_c40_7886_ins,
stz_uxn_opcodes_h_l2912_c40_7886_previous_stack_read,
stz_uxn_opcodes_h_l2912_c40_7886_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_f183
opc_result_MUX_uxn_opcodes_h_l2913_c7_f183 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_return_output);

-- stz2_uxn_opcodes_h_l2913_c40_552e
stz2_uxn_opcodes_h_l2913_c40_552e : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2913_c40_552e_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2913_c40_552e_phase,
stz2_uxn_opcodes_h_l2913_c40_552e_ins,
stz2_uxn_opcodes_h_l2913_c40_552e_previous_stack_read,
stz2_uxn_opcodes_h_l2913_c40_552e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9
opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output);

-- ldr_uxn_opcodes_h_l2914_c40_33f4
ldr_uxn_opcodes_h_l2914_c40_33f4 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2914_c40_33f4_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2914_c40_33f4_phase,
ldr_uxn_opcodes_h_l2914_c40_33f4_ins,
ldr_uxn_opcodes_h_l2914_c40_33f4_pc,
ldr_uxn_opcodes_h_l2914_c40_33f4_previous_stack_read,
ldr_uxn_opcodes_h_l2914_c40_33f4_previous_ram_read,
ldr_uxn_opcodes_h_l2914_c40_33f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_710d
opc_result_MUX_uxn_opcodes_h_l2915_c7_710d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_return_output);

-- ldr2_uxn_opcodes_h_l2915_c40_018f
ldr2_uxn_opcodes_h_l2915_c40_018f : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2915_c40_018f_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2915_c40_018f_phase,
ldr2_uxn_opcodes_h_l2915_c40_018f_ins,
ldr2_uxn_opcodes_h_l2915_c40_018f_pc,
ldr2_uxn_opcodes_h_l2915_c40_018f_previous_stack_read,
ldr2_uxn_opcodes_h_l2915_c40_018f_previous_ram_read,
ldr2_uxn_opcodes_h_l2915_c40_018f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6
opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output);

-- str1_uxn_opcodes_h_l2916_c40_3c55
str1_uxn_opcodes_h_l2916_c40_3c55 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2916_c40_3c55_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2916_c40_3c55_phase,
str1_uxn_opcodes_h_l2916_c40_3c55_ins,
str1_uxn_opcodes_h_l2916_c40_3c55_pc,
str1_uxn_opcodes_h_l2916_c40_3c55_previous_stack_read,
str1_uxn_opcodes_h_l2916_c40_3c55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce
opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output);

-- str2_uxn_opcodes_h_l2917_c40_2109
str2_uxn_opcodes_h_l2917_c40_2109 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2917_c40_2109_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2917_c40_2109_phase,
str2_uxn_opcodes_h_l2917_c40_2109_ins,
str2_uxn_opcodes_h_l2917_c40_2109_pc,
str2_uxn_opcodes_h_l2917_c40_2109_previous_stack_read,
str2_uxn_opcodes_h_l2917_c40_2109_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e
opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output);

-- lda_uxn_opcodes_h_l2918_c40_c0da
lda_uxn_opcodes_h_l2918_c40_c0da : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2918_c40_c0da_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2918_c40_c0da_phase,
lda_uxn_opcodes_h_l2918_c40_c0da_ins,
lda_uxn_opcodes_h_l2918_c40_c0da_previous_stack_read,
lda_uxn_opcodes_h_l2918_c40_c0da_previous_ram_read,
lda_uxn_opcodes_h_l2918_c40_c0da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0
opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output);

-- lda2_uxn_opcodes_h_l2919_c40_882a
lda2_uxn_opcodes_h_l2919_c40_882a : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2919_c40_882a_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2919_c40_882a_phase,
lda2_uxn_opcodes_h_l2919_c40_882a_ins,
lda2_uxn_opcodes_h_l2919_c40_882a_previous_stack_read,
lda2_uxn_opcodes_h_l2919_c40_882a_previous_ram_read,
lda2_uxn_opcodes_h_l2919_c40_882a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a
opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output);

-- sta_uxn_opcodes_h_l2920_c40_cb83
sta_uxn_opcodes_h_l2920_c40_cb83 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2920_c40_cb83_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2920_c40_cb83_phase,
sta_uxn_opcodes_h_l2920_c40_cb83_ins,
sta_uxn_opcodes_h_l2920_c40_cb83_previous_stack_read,
sta_uxn_opcodes_h_l2920_c40_cb83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea
opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output);

-- sta2_uxn_opcodes_h_l2921_c40_c7d0
sta2_uxn_opcodes_h_l2921_c40_c7d0 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2921_c40_c7d0_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2921_c40_c7d0_phase,
sta2_uxn_opcodes_h_l2921_c40_c7d0_ins,
sta2_uxn_opcodes_h_l2921_c40_c7d0_previous_stack_read,
sta2_uxn_opcodes_h_l2921_c40_c7d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_940b
opc_result_MUX_uxn_opcodes_h_l2922_c7_940b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_return_output);

-- dei_uxn_opcodes_h_l2922_c40_63e9
dei_uxn_opcodes_h_l2922_c40_63e9 : entity work.dei_0CLK_11d1c5ea port map (
clk,
dei_uxn_opcodes_h_l2922_c40_63e9_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2922_c40_63e9_phase,
dei_uxn_opcodes_h_l2922_c40_63e9_ins,
dei_uxn_opcodes_h_l2922_c40_63e9_controller0_buttons,
dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr0,
dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr1,
dei_uxn_opcodes_h_l2922_c40_63e9_previous_stack_read,
dei_uxn_opcodes_h_l2922_c40_63e9_previous_device_ram_read,
dei_uxn_opcodes_h_l2922_c40_63e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_2925
opc_result_MUX_uxn_opcodes_h_l2923_c7_2925 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_return_output);

-- dei2_uxn_opcodes_h_l2923_c40_10cf
dei2_uxn_opcodes_h_l2923_c40_10cf : entity work.dei2_0CLK_898867fd port map (
clk,
dei2_uxn_opcodes_h_l2923_c40_10cf_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2923_c40_10cf_phase,
dei2_uxn_opcodes_h_l2923_c40_10cf_ins,
dei2_uxn_opcodes_h_l2923_c40_10cf_controller0_buttons,
dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr0,
dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr1,
dei2_uxn_opcodes_h_l2923_c40_10cf_previous_stack_read,
dei2_uxn_opcodes_h_l2923_c40_10cf_previous_device_ram_read,
dei2_uxn_opcodes_h_l2923_c40_10cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74
opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output);

-- deo_uxn_opcodes_h_l2924_c40_9287
deo_uxn_opcodes_h_l2924_c40_9287 : entity work.deo_0CLK_65c69ceb port map (
clk,
deo_uxn_opcodes_h_l2924_c40_9287_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2924_c40_9287_phase,
deo_uxn_opcodes_h_l2924_c40_9287_ins,
deo_uxn_opcodes_h_l2924_c40_9287_previous_stack_read,
deo_uxn_opcodes_h_l2924_c40_9287_previous_device_ram_read,
deo_uxn_opcodes_h_l2924_c40_9287_previous_ram_read,
deo_uxn_opcodes_h_l2924_c40_9287_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97
opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output);

-- deo2_uxn_opcodes_h_l2925_c40_beda
deo2_uxn_opcodes_h_l2925_c40_beda : entity work.deo2_0CLK_8faca1d2 port map (
clk,
deo2_uxn_opcodes_h_l2925_c40_beda_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2925_c40_beda_phase,
deo2_uxn_opcodes_h_l2925_c40_beda_ins,
deo2_uxn_opcodes_h_l2925_c40_beda_previous_stack_read,
deo2_uxn_opcodes_h_l2925_c40_beda_previous_device_ram_read,
deo2_uxn_opcodes_h_l2925_c40_beda_previous_ram_read,
deo2_uxn_opcodes_h_l2925_c40_beda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88
opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output);

-- add_uxn_opcodes_h_l2926_c40_e989
add_uxn_opcodes_h_l2926_c40_e989 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2926_c40_e989_CLOCK_ENABLE,
add_uxn_opcodes_h_l2926_c40_e989_phase,
add_uxn_opcodes_h_l2926_c40_e989_ins,
add_uxn_opcodes_h_l2926_c40_e989_previous_stack_read,
add_uxn_opcodes_h_l2926_c40_e989_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_d469
opc_result_MUX_uxn_opcodes_h_l2927_c7_d469 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_return_output);

-- add2_uxn_opcodes_h_l2927_c40_f98d
add2_uxn_opcodes_h_l2927_c40_f98d : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2927_c40_f98d_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2927_c40_f98d_phase,
add2_uxn_opcodes_h_l2927_c40_f98d_ins,
add2_uxn_opcodes_h_l2927_c40_f98d_previous_stack_read,
add2_uxn_opcodes_h_l2927_c40_f98d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_861d
opc_result_MUX_uxn_opcodes_h_l2928_c7_861d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_return_output);

-- sub1_uxn_opcodes_h_l2928_c40_698d
sub1_uxn_opcodes_h_l2928_c40_698d : entity work.sub1_0CLK_64d180f1 port map (
clk,
sub1_uxn_opcodes_h_l2928_c40_698d_CLOCK_ENABLE,
sub1_uxn_opcodes_h_l2928_c40_698d_phase,
sub1_uxn_opcodes_h_l2928_c40_698d_ins,
sub1_uxn_opcodes_h_l2928_c40_698d_previous_stack_read,
sub1_uxn_opcodes_h_l2928_c40_698d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_be48
opc_result_MUX_uxn_opcodes_h_l2929_c7_be48 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_return_output);

-- sub2_uxn_opcodes_h_l2929_c40_ac6a
sub2_uxn_opcodes_h_l2929_c40_ac6a : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2929_c40_ac6a_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2929_c40_ac6a_phase,
sub2_uxn_opcodes_h_l2929_c40_ac6a_ins,
sub2_uxn_opcodes_h_l2929_c40_ac6a_previous_stack_read,
sub2_uxn_opcodes_h_l2929_c40_ac6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9
opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output);

-- mul_uxn_opcodes_h_l2930_c40_e9da
mul_uxn_opcodes_h_l2930_c40_e9da : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2930_c40_e9da_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2930_c40_e9da_phase,
mul_uxn_opcodes_h_l2930_c40_e9da_ins,
mul_uxn_opcodes_h_l2930_c40_e9da_previous_stack_read,
mul_uxn_opcodes_h_l2930_c40_e9da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_2738
opc_result_MUX_uxn_opcodes_h_l2931_c7_2738 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_return_output);

-- mul2_uxn_opcodes_h_l2931_c40_c686
mul2_uxn_opcodes_h_l2931_c40_c686 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2931_c40_c686_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2931_c40_c686_phase,
mul2_uxn_opcodes_h_l2931_c40_c686_ins,
mul2_uxn_opcodes_h_l2931_c40_c686_previous_stack_read,
mul2_uxn_opcodes_h_l2931_c40_c686_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_e649
opc_result_MUX_uxn_opcodes_h_l2932_c7_e649 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_return_output);

-- div_uxn_opcodes_h_l2932_c40_ace9
div_uxn_opcodes_h_l2932_c40_ace9 : entity work.div_0CLK_4e24eea7 port map (
clk,
div_uxn_opcodes_h_l2932_c40_ace9_CLOCK_ENABLE,
div_uxn_opcodes_h_l2932_c40_ace9_phase,
div_uxn_opcodes_h_l2932_c40_ace9_ins,
div_uxn_opcodes_h_l2932_c40_ace9_previous_stack_read,
div_uxn_opcodes_h_l2932_c40_ace9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_6315
opc_result_MUX_uxn_opcodes_h_l2933_c7_6315 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_return_output);

-- div2_uxn_opcodes_h_l2933_c40_6f87
div2_uxn_opcodes_h_l2933_c40_6f87 : entity work.div2_0CLK_7c6279d3 port map (
clk,
div2_uxn_opcodes_h_l2933_c40_6f87_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2933_c40_6f87_phase,
div2_uxn_opcodes_h_l2933_c40_6f87_ins,
div2_uxn_opcodes_h_l2933_c40_6f87_previous_stack_read,
div2_uxn_opcodes_h_l2933_c40_6f87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_584a
opc_result_MUX_uxn_opcodes_h_l2934_c7_584a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_return_output);

-- and_uxn_opcodes_h_l2934_c40_68ed
and_uxn_opcodes_h_l2934_c40_68ed : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2934_c40_68ed_CLOCK_ENABLE,
and_uxn_opcodes_h_l2934_c40_68ed_phase,
and_uxn_opcodes_h_l2934_c40_68ed_ins,
and_uxn_opcodes_h_l2934_c40_68ed_previous_stack_read,
and_uxn_opcodes_h_l2934_c40_68ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_803c
opc_result_MUX_uxn_opcodes_h_l2935_c7_803c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_return_output);

-- and2_uxn_opcodes_h_l2935_c40_ebb9
and2_uxn_opcodes_h_l2935_c40_ebb9 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2935_c40_ebb9_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2935_c40_ebb9_phase,
and2_uxn_opcodes_h_l2935_c40_ebb9_ins,
and2_uxn_opcodes_h_l2935_c40_ebb9_previous_stack_read,
and2_uxn_opcodes_h_l2935_c40_ebb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0
opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output);

-- ora_uxn_opcodes_h_l2936_c40_342d
ora_uxn_opcodes_h_l2936_c40_342d : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2936_c40_342d_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2936_c40_342d_phase,
ora_uxn_opcodes_h_l2936_c40_342d_ins,
ora_uxn_opcodes_h_l2936_c40_342d_previous_stack_read,
ora_uxn_opcodes_h_l2936_c40_342d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_342d
opc_result_MUX_uxn_opcodes_h_l2937_c7_342d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_return_output);

-- ora2_uxn_opcodes_h_l2937_c40_43d2
ora2_uxn_opcodes_h_l2937_c40_43d2 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2937_c40_43d2_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2937_c40_43d2_phase,
ora2_uxn_opcodes_h_l2937_c40_43d2_ins,
ora2_uxn_opcodes_h_l2937_c40_43d2_previous_stack_read,
ora2_uxn_opcodes_h_l2937_c40_43d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea
opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output);

-- eor_uxn_opcodes_h_l2938_c40_18e9
eor_uxn_opcodes_h_l2938_c40_18e9 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2938_c40_18e9_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2938_c40_18e9_phase,
eor_uxn_opcodes_h_l2938_c40_18e9_ins,
eor_uxn_opcodes_h_l2938_c40_18e9_previous_stack_read,
eor_uxn_opcodes_h_l2938_c40_18e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_2717
opc_result_MUX_uxn_opcodes_h_l2939_c7_2717 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_return_output);

-- eor2_uxn_opcodes_h_l2939_c40_58dd
eor2_uxn_opcodes_h_l2939_c40_58dd : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2939_c40_58dd_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2939_c40_58dd_phase,
eor2_uxn_opcodes_h_l2939_c40_58dd_ins,
eor2_uxn_opcodes_h_l2939_c40_58dd_previous_stack_read,
eor2_uxn_opcodes_h_l2939_c40_58dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2
opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output);

-- sft_uxn_opcodes_h_l2940_c40_78aa
sft_uxn_opcodes_h_l2940_c40_78aa : entity work.sft_0CLK_8d2aa467 port map (
clk,
sft_uxn_opcodes_h_l2940_c40_78aa_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2940_c40_78aa_phase,
sft_uxn_opcodes_h_l2940_c40_78aa_ins,
sft_uxn_opcodes_h_l2940_c40_78aa_previous_stack_read,
sft_uxn_opcodes_h_l2940_c40_78aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_e399
opc_result_MUX_uxn_opcodes_h_l2941_c7_e399 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_return_output);

-- sft2_uxn_opcodes_h_l2941_c40_8221
sft2_uxn_opcodes_h_l2941_c40_8221 : entity work.sft2_0CLK_af0d23d3 port map (
clk,
sft2_uxn_opcodes_h_l2941_c40_8221_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2941_c40_8221_phase,
sft2_uxn_opcodes_h_l2941_c40_8221_ins,
sft2_uxn_opcodes_h_l2941_c40_8221_previous_stack_read,
sft2_uxn_opcodes_h_l2941_c40_8221_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31
CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_x,
CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_left,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_right,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output);

-- sp0_MUX_uxn_opcodes_h_l2946_c2_b109
sp0_MUX_uxn_opcodes_h_l2946_c2_b109 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2946_c2_b109_cond,
sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue,
sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse,
sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output);

-- sp1_MUX_uxn_opcodes_h_l2946_c2_b109
sp1_MUX_uxn_opcodes_h_l2946_c2_b109 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2946_c2_b109_cond,
sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue,
sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse,
sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_left,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_right,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_left,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_right,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_return_output);

-- MUX_uxn_opcodes_h_l2952_c29_9993
MUX_uxn_opcodes_h_l2952_c29_9993 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c29_9993_cond,
MUX_uxn_opcodes_h_l2952_c29_9993_iftrue,
MUX_uxn_opcodes_h_l2952_c29_9993_iffalse,
MUX_uxn_opcodes_h_l2952_c29_9993_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_left,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_right,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_return_output);

-- MUX_uxn_opcodes_h_l2953_c20_c6e0
MUX_uxn_opcodes_h_l2953_c20_c6e0 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2953_c20_c6e0_cond,
MUX_uxn_opcodes_h_l2953_c20_c6e0_iftrue,
MUX_uxn_opcodes_h_l2953_c20_c6e0_iffalse,
MUX_uxn_opcodes_h_l2953_c20_c6e0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_left,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_right,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output);

-- stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c
stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_stack_address,
stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_value,
stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_write_enable,
stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 controller0_buttons,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 sp0,
 sp1,
 ins_a,
 opc,
 stack_index,
 is_wait,
 stack_address,
 previous_stack_read,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_return_output,
 MUX_uxn_opcodes_h_l2865_c10_8465_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output,
 is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output,
 brk_uxn_opcodes_h_l2872_c48_95ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_return_output,
 jci_uxn_opcodes_h_l2873_c40_677b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output,
 jmi_uxn_opcodes_h_l2874_c40_de31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output,
 jsi_uxn_opcodes_h_l2875_c40_5b65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output,
 lit_uxn_opcodes_h_l2876_c40_1900_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output,
 lit2_uxn_opcodes_h_l2877_c40_c47e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output,
 lit_uxn_opcodes_h_l2878_c40_b870_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output,
 lit2_uxn_opcodes_h_l2879_c40_ab18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_return_output,
 inc_uxn_opcodes_h_l2880_c40_6843_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output,
 inc2_uxn_opcodes_h_l2881_c40_85e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output,
 pop_uxn_opcodes_h_l2882_c40_9bb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output,
 pop2_uxn_opcodes_h_l2883_c40_7c0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output,
 nip_uxn_opcodes_h_l2884_c40_e8b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output,
 nip2_uxn_opcodes_h_l2885_c40_6bb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output,
 swp_uxn_opcodes_h_l2886_c40_ec11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output,
 swp2_uxn_opcodes_h_l2887_c40_6743_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output,
 rot_uxn_opcodes_h_l2888_c40_8292_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output,
 rot2_uxn_opcodes_h_l2889_c40_a7c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output,
 dup_uxn_opcodes_h_l2890_c40_46c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_return_output,
 dup2_uxn_opcodes_h_l2891_c40_400a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output,
 ovr_uxn_opcodes_h_l2892_c40_961b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output,
 ovr2_uxn_opcodes_h_l2893_c40_1de2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_return_output,
 equ_uxn_opcodes_h_l2894_c40_4448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output,
 equ2_uxn_opcodes_h_l2895_c40_b755_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_return_output,
 neq_uxn_opcodes_h_l2896_c40_76a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output,
 neq2_uxn_opcodes_h_l2897_c40_3b32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_return_output,
 gth_uxn_opcodes_h_l2898_c40_3582_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output,
 gth2_uxn_opcodes_h_l2899_c40_6f72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output,
 lth_uxn_opcodes_h_l2900_c40_ff91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output,
 lth2_uxn_opcodes_h_l2901_c40_5d3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output,
 jmp_uxn_opcodes_h_l2902_c40_0e1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_return_output,
 jmp2_uxn_opcodes_h_l2903_c40_a7db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_return_output,
 jcn_uxn_opcodes_h_l2904_c40_47a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output,
 jcn2_uxn_opcodes_h_l2905_c40_7f93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output,
 jsr_uxn_opcodes_h_l2906_c40_a423_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_return_output,
 jsr2_uxn_opcodes_h_l2907_c40_4e6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output,
 sth_uxn_opcodes_h_l2908_c40_bf35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output,
 sth2_uxn_opcodes_h_l2909_c40_f4c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output,
 ldz_uxn_opcodes_h_l2910_c40_5852_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_return_output,
 ldz2_uxn_opcodes_h_l2911_c40_4580_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output,
 stz_uxn_opcodes_h_l2912_c40_7886_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_return_output,
 stz2_uxn_opcodes_h_l2913_c40_552e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output,
 ldr_uxn_opcodes_h_l2914_c40_33f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_return_output,
 ldr2_uxn_opcodes_h_l2915_c40_018f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output,
 str1_uxn_opcodes_h_l2916_c40_3c55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output,
 str2_uxn_opcodes_h_l2917_c40_2109_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output,
 lda_uxn_opcodes_h_l2918_c40_c0da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output,
 lda2_uxn_opcodes_h_l2919_c40_882a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output,
 sta_uxn_opcodes_h_l2920_c40_cb83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output,
 sta2_uxn_opcodes_h_l2921_c40_c7d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_return_output,
 dei_uxn_opcodes_h_l2922_c40_63e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_return_output,
 dei2_uxn_opcodes_h_l2923_c40_10cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output,
 deo_uxn_opcodes_h_l2924_c40_9287_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output,
 deo2_uxn_opcodes_h_l2925_c40_beda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output,
 add_uxn_opcodes_h_l2926_c40_e989_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_return_output,
 add2_uxn_opcodes_h_l2927_c40_f98d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_return_output,
 sub1_uxn_opcodes_h_l2928_c40_698d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_return_output,
 sub2_uxn_opcodes_h_l2929_c40_ac6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output,
 mul_uxn_opcodes_h_l2930_c40_e9da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_return_output,
 mul2_uxn_opcodes_h_l2931_c40_c686_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_return_output,
 div_uxn_opcodes_h_l2932_c40_ace9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_return_output,
 div2_uxn_opcodes_h_l2933_c40_6f87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_return_output,
 and_uxn_opcodes_h_l2934_c40_68ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_return_output,
 and2_uxn_opcodes_h_l2935_c40_ebb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output,
 ora_uxn_opcodes_h_l2936_c40_342d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_return_output,
 ora2_uxn_opcodes_h_l2937_c40_43d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output,
 eor_uxn_opcodes_h_l2938_c40_18e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_return_output,
 eor2_uxn_opcodes_h_l2939_c40_58dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output,
 sft_uxn_opcodes_h_l2940_c40_78aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_return_output,
 sft2_uxn_opcodes_h_l2941_c40_8221_return_output,
 CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output,
 sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output,
 sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_return_output,
 MUX_uxn_opcodes_h_l2952_c29_9993_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_return_output,
 MUX_uxn_opcodes_h_l2953_c20_c6e0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output,
 stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_8465_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_left : unsigned(4 downto 0);
 variable VAR_uint8_4_0_uxn_opcodes_h_l2865_c10_afe4_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_8465_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_8465_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_8465_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_95ce_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_95ce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_677b_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_677b_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_677b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_677b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_677b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_677b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_de31_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_de31_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_de31_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_de31_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_de31_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_1900_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_1900_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_1900_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_1900_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_1900_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_b870_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_b870_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_b870_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_b870_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_b870_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_6843_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_6843_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_6843_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_6843_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_6843_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_ec11_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_ec11_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_ec11_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_ec11_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_ec11_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_6743_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_6743_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_6743_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_6743_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_6743_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_8292_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_8292_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_8292_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_8292_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_8292_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_46c6_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_46c6_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_46c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_46c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_46c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_400a_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_400a_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_400a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_400a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_400a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_961b_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_961b_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_961b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_961b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_961b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_4448_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_4448_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_4448_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_4448_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_4448_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_b755_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_b755_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_b755_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_b755_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_b755_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_76a5_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_76a5_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_76a5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_76a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_76a5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_3582_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_3582_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_3582_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_3582_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_3582_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ff91_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ff91_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ff91_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ff91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ff91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_a423_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_a423_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_a423_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_a423_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_a423_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_a423_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_bf35_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_bf35_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_bf35_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_bf35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_bf35_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_5852_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_5852_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_5852_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_5852_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_5852_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_5852_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_7886_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_7886_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_7886_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_7886_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_7886_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_552e_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_552e_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_552e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_552e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_552e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_3c55_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_3c55_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_3c55_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_3c55_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_3c55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_3c55_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_2109_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_2109_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_2109_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_2109_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_2109_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_2109_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_c0da_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_c0da_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_c0da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_c0da_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_c0da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_c0da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_882a_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_882a_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_882a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_882a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_882a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_882a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_cb83_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_cb83_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_cb83_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_cb83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_cb83_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_63e9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_9287_phase : unsigned(11 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_9287_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_9287_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_9287_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_beda_phase : unsigned(11 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_beda_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_beda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_beda_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_e989_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_e989_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_e989_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_e989_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_e989_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_f98d_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_f98d_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_f98d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_f98d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_f98d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_cond : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_698d_phase : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_698d_ins : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_698d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_698d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_698d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_e9da_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_e9da_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_e9da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_e9da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_e9da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_c686_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_c686_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_c686_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_c686_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_c686_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_ace9_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_ace9_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_ace9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_ace9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_ace9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_6f87_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_6f87_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_6f87_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_6f87_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_6f87_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_68ed_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_68ed_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_68ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_68ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_68ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_342d_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_342d_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_342d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_342d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_342d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_18e9_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_18e9_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_18e9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_18e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_18e9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_78aa_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_78aa_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_78aa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_78aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_78aa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_8221_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_8221_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_8221_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_8221_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_8221_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2943_c2_b43f : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_d73a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2949_c3_7e9c : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2947_c3_7e6e : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_9993_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_9993_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_9993_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_9993_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_d680_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_a2a1_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_7e32_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_14de_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_03bf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_d443_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_55e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_bf00_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_8a1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_ebf0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_84c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_b842_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_43be_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_57f9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_72c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_30ea_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_ins_a : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_wait : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(8 downto 0);
variable REG_VAR_previous_stack_read : unsigned(7 downto 0);
variable REG_VAR_opc_result : opcode_result_t;
variable REG_VAR_opc_eval_result : eval_opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_ins_a := ins_a;
  REG_VAR_opc := opc;
  REG_VAR_stack_index := stack_index;
  REG_VAR_is_wait := is_wait;
  REG_VAR_stack_address := stack_address;
  REG_VAR_previous_stack_read := previous_stack_read;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_right := to_unsigned(57, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_right := to_unsigned(192, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_right := to_unsigned(40, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_right := to_unsigned(25, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_right := to_unsigned(18, 8);
     VAR_MUX_uxn_opcodes_h_l2865_c10_8465_iffalse := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_right := to_unsigned(45, 8);
     VAR_MUX_uxn_opcodes_h_l2865_c10_8465_iftrue := to_unsigned(255, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_right := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_right := to_unsigned(17, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_right := to_unsigned(53, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_right := to_unsigned(64, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_right := to_unsigned(50, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_right := to_unsigned(6, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_right := to_unsigned(30, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_right := to_unsigned(39, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_right := to_unsigned(43, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_right := to_unsigned(44, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_right := to_unsigned(23, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_right := to_unsigned(61, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_right := to_unsigned(28, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_iftrue := to_unsigned(256, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_right := to_unsigned(27, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_right := to_unsigned(37, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_right := to_unsigned(56, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_right := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_right := to_unsigned(47, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_right := to_unsigned(224, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_right := to_unsigned(96, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_right := to_unsigned(54, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_right := to_unsigned(36, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_right := to_unsigned(38, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_controller0_buttons := VAR_controller0_buttons;
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_x := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2927_c40_f98d_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2926_c40_e989_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2934_c40_68ed_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2925_c40_beda_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2924_c40_9287_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2933_c40_6f87_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2932_c40_ace9_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2891_c40_400a_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2890_c40_46c6_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2938_c40_18e9_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2895_c40_b755_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2894_c40_4448_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2898_c40_3582_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2880_c40_6843_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2906_c40_a423_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2919_c40_882a_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2918_c40_c0da_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2910_c40_5852_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2900_c40_ff91_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2931_c40_c686_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2930_c40_e9da_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2896_c40_76a5_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2936_c40_342d_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2892_c40_961b_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2888_c40_8292_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2941_c40_8221_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2940_c40_78aa_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2920_c40_cb83_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2908_c40_bf35_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2916_c40_3c55_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2917_c40_2109_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2913_c40_552e_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2912_c40_7886_ins := VAR_ins;
     VAR_sub1_uxn_opcodes_h_l2928_c40_698d_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2887_c40_6743_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2886_c40_ec11_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2873_c40_677b_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2874_c40_de31_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2906_c40_a423_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2876_c40_1900_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2878_c40_b870_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2916_c40_3c55_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2917_c40_2109_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2927_c40_f98d_phase := resize(VAR_phase, 8);
     VAR_add_uxn_opcodes_h_l2926_c40_e989_phase := resize(VAR_phase, 8);
     VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_phase := resize(VAR_phase, 8);
     VAR_and_uxn_opcodes_h_l2934_c40_68ed_phase := resize(VAR_phase, 8);
     VAR_brk_uxn_opcodes_h_l2872_c48_95ce_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_phase := resize(VAR_phase, 8);
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_phase := resize(VAR_phase, 8);
     VAR_deo2_uxn_opcodes_h_l2925_c40_beda_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2924_c40_9287_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2933_c40_6f87_phase := resize(VAR_phase, 8);
     VAR_div_uxn_opcodes_h_l2932_c40_ace9_phase := resize(VAR_phase, 8);
     VAR_dup2_uxn_opcodes_h_l2891_c40_400a_phase := resize(VAR_phase, 8);
     VAR_dup_uxn_opcodes_h_l2890_c40_46c6_phase := resize(VAR_phase, 8);
     VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_phase := resize(VAR_phase, 8);
     VAR_eor_uxn_opcodes_h_l2938_c40_18e9_phase := resize(VAR_phase, 8);
     VAR_equ2_uxn_opcodes_h_l2895_c40_b755_phase := resize(VAR_phase, 8);
     VAR_equ_uxn_opcodes_h_l2894_c40_4448_phase := resize(VAR_phase, 8);
     VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_phase := resize(VAR_phase, 8);
     VAR_gth_uxn_opcodes_h_l2898_c40_3582_phase := resize(VAR_phase, 8);
     VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_phase := resize(VAR_phase, 8);
     VAR_inc_uxn_opcodes_h_l2880_c40_6843_phase := resize(VAR_phase, 8);
     VAR_jci_uxn_opcodes_h_l2873_c40_677b_phase := resize(VAR_phase, 8);
     VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_phase := resize(VAR_phase, 8);
     VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_phase := resize(VAR_phase, 8);
     VAR_jmi_uxn_opcodes_h_l2874_c40_de31_phase := resize(VAR_phase, 8);
     VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_phase := resize(VAR_phase, 8);
     VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_phase := resize(VAR_phase, 8);
     VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_phase := resize(VAR_phase, 8);
     VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_phase := resize(VAR_phase, 8);
     VAR_jsr_uxn_opcodes_h_l2906_c40_a423_phase := resize(VAR_phase, 8);
     VAR_lda2_uxn_opcodes_h_l2919_c40_882a_phase := resize(VAR_phase, 8);
     VAR_lda_uxn_opcodes_h_l2918_c40_c0da_phase := resize(VAR_phase, 8);
     VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_phase := resize(VAR_phase, 8);
     VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_phase := resize(VAR_phase, 8);
     VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_phase := resize(VAR_phase, 8);
     VAR_ldz_uxn_opcodes_h_l2910_c40_5852_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2876_c40_1900_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2878_c40_b870_phase := resize(VAR_phase, 8);
     VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_phase := resize(VAR_phase, 8);
     VAR_lth_uxn_opcodes_h_l2900_c40_ff91_phase := resize(VAR_phase, 8);
     VAR_mul2_uxn_opcodes_h_l2931_c40_c686_phase := resize(VAR_phase, 8);
     VAR_mul_uxn_opcodes_h_l2930_c40_e9da_phase := resize(VAR_phase, 8);
     VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_phase := resize(VAR_phase, 8);
     VAR_neq_uxn_opcodes_h_l2896_c40_76a5_phase := resize(VAR_phase, 8);
     VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_phase := resize(VAR_phase, 8);
     VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_phase := resize(VAR_phase, 8);
     VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_phase := resize(VAR_phase, 8);
     VAR_ora_uxn_opcodes_h_l2936_c40_342d_phase := resize(VAR_phase, 8);
     VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_phase := resize(VAR_phase, 8);
     VAR_ovr_uxn_opcodes_h_l2892_c40_961b_phase := resize(VAR_phase, 8);
     VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_phase := resize(VAR_phase, 8);
     VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_phase := resize(VAR_phase, 8);
     VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_phase := resize(VAR_phase, 8);
     VAR_rot_uxn_opcodes_h_l2888_c40_8292_phase := resize(VAR_phase, 8);
     VAR_sft2_uxn_opcodes_h_l2941_c40_8221_phase := resize(VAR_phase, 8);
     VAR_sft_uxn_opcodes_h_l2940_c40_78aa_phase := resize(VAR_phase, 8);
     VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_phase := resize(VAR_phase, 8);
     VAR_sta_uxn_opcodes_h_l2920_c40_cb83_phase := resize(VAR_phase, 8);
     VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_phase := resize(VAR_phase, 8);
     VAR_sth_uxn_opcodes_h_l2908_c40_bf35_phase := resize(VAR_phase, 8);
     VAR_str1_uxn_opcodes_h_l2916_c40_3c55_phase := resize(VAR_phase, 8);
     VAR_str2_uxn_opcodes_h_l2917_c40_2109_phase := resize(VAR_phase, 8);
     VAR_stz2_uxn_opcodes_h_l2913_c40_552e_phase := resize(VAR_phase, 8);
     VAR_stz_uxn_opcodes_h_l2912_c40_7886_phase := resize(VAR_phase, 8);
     VAR_sub1_uxn_opcodes_h_l2928_c40_698d_phase := resize(VAR_phase, 8);
     VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_phase := resize(VAR_phase, 8);
     VAR_swp2_uxn_opcodes_h_l2887_c40_6743_phase := resize(VAR_phase, 8);
     VAR_swp_uxn_opcodes_h_l2886_c40_ec11_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_677b_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2874_c40_de31_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_882a_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_c0da_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_5852_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2876_c40_1900_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2878_c40_b870_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2927_c40_f98d_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2926_c40_e989_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2934_c40_68ed_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2933_c40_6f87_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2932_c40_ace9_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2891_c40_400a_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2890_c40_46c6_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2938_c40_18e9_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2895_c40_b755_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2894_c40_4448_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2898_c40_3582_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2880_c40_6843_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_677b_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2906_c40_a423_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_882a_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_c0da_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_5852_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2900_c40_ff91_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2931_c40_c686_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2930_c40_e9da_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2896_c40_76a5_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2936_c40_342d_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2892_c40_961b_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2888_c40_8292_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2941_c40_8221_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2940_c40_78aa_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2920_c40_cb83_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2908_c40_bf35_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2916_c40_3c55_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2917_c40_2109_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2913_c40_552e_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2912_c40_7886_previous_stack_read := previous_stack_read;
     VAR_sub1_uxn_opcodes_h_l2928_c40_698d_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2887_c40_6743_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2886_c40_ec11_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr0 := sp0;
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr0 := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr1 := sp1;
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr1 := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse := sp1;
     -- brk[uxn_opcodes_h_l2872_c48_95ce] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2872_c48_95ce_phase <= VAR_brk_uxn_opcodes_h_l2872_c48_95ce_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2872_c48_95ce_return_output := brk_uxn_opcodes_h_l2872_c48_95ce_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2943_c16_5c31] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_return_output := CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_return_output;

     -- uint8_4_0[uxn_opcodes_h_l2865_c10_afe4] LATENCY=0
     VAR_uint8_4_0_uxn_opcodes_h_l2865_c10_afe4_return_output := uint8_4_0(
     VAR_ins);

     -- Submodule level 1
     VAR_stack_index_uxn_opcodes_h_l2943_c2_b43f := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_5c31_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue := VAR_brk_uxn_opcodes_h_l2872_c48_95ce_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_left := VAR_uint8_4_0_uxn_opcodes_h_l2865_c10_afe4_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_left := VAR_stack_index_uxn_opcodes_h_l2943_c2_b43f;
     -- BIN_OP_EQ[uxn_opcodes_h_l2865_c10_9eb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2865_c10_8465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_9eb6_return_output;
     -- MUX[uxn_opcodes_h_l2865_c10_8465] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c10_8465_cond <= VAR_MUX_uxn_opcodes_h_l2865_c10_8465_cond;
     MUX_uxn_opcodes_h_l2865_c10_8465_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c10_8465_iftrue;
     MUX_uxn_opcodes_h_l2865_c10_8465_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c10_8465_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c10_8465_return_output := MUX_uxn_opcodes_h_l2865_c10_8465_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_right := VAR_MUX_uxn_opcodes_h_l2865_c10_8465_return_output;
     REG_VAR_ins_a := VAR_MUX_uxn_opcodes_h_l2865_c10_8465_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l2866_c8_537c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_left;
     BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output := BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;

     -- Submodule level 4
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     REG_VAR_opc := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_537c_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_5c60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_b477] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_be38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_17f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_ffbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_ee4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_625c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_d015] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_5ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_063f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_a2b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_8c5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_50b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c944] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_25cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_3cce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_d347] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_f053] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_dc17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_612e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_81fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_0ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_3fde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_2004] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_b694] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_663c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_c17d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_c2bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_2aa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_ea6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_1940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_d0aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_fc9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_c1e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_ef59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_93e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_0aca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_3f5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_a078] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_efff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_0d76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_6802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_221e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_9c48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_7d3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_2269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_ec71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_fdcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_8992] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_4d73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_3d4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1745] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_8716] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_5f89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_bbc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_dc29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_0a1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_486d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_d02c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_d47b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_6b38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_9e41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_c496] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_7112] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_9c42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_c4f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_6419] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_176a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_c3bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_e848] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_6419_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_efff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_93e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_9e41_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be38_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7112_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8c5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c496_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_663c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3d4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c2bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ee4b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_17f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_0aca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6802_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2004_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_c1e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d47b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_063f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_486d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_4d73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c3bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_c17d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f053_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_0d76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_a2b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e848_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ffbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d02c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_5ebb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_ef59_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_ea6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_2269_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0a1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fc9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_625c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_176a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_2aa0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8716_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_b477_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_c4f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_dc29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_3cce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b694_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_25cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_5f89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d015_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_7d3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a078_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bbc7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ec71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_3f5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_d0aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_0ded_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_612e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_3fde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_9c42_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_9c48_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c944_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_d347_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_5c60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_8992_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_fdcc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_1940_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_6b38_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1745_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_81fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_50b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_dc17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_221e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_c075] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2872_c2_9b09] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_cond;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output := is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_c075_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_1f7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_2a89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output;
     VAR_jci_uxn_opcodes_h_l2873_c40_677b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_2a89_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_dc6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output;

     -- jci[uxn_opcodes_h_l2873_c40_677b] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2873_c40_677b_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2873_c40_677b_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2873_c40_677b_phase <= VAR_jci_uxn_opcodes_h_l2873_c40_677b_phase;
     jci_uxn_opcodes_h_l2873_c40_677b_pc <= VAR_jci_uxn_opcodes_h_l2873_c40_677b_pc;
     jci_uxn_opcodes_h_l2873_c40_677b_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2873_c40_677b_previous_stack_read;
     jci_uxn_opcodes_h_l2873_c40_677b_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2873_c40_677b_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2873_c40_677b_return_output := jci_uxn_opcodes_h_l2873_c40_677b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_dc34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output;
     VAR_jmi_uxn_opcodes_h_l2874_c40_de31_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_dc34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue := VAR_jci_uxn_opcodes_h_l2873_c40_677b_return_output;
     -- jmi[uxn_opcodes_h_l2874_c40_de31] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2874_c40_de31_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2874_c40_de31_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2874_c40_de31_phase <= VAR_jmi_uxn_opcodes_h_l2874_c40_de31_phase;
     jmi_uxn_opcodes_h_l2874_c40_de31_pc <= VAR_jmi_uxn_opcodes_h_l2874_c40_de31_pc;
     jmi_uxn_opcodes_h_l2874_c40_de31_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2874_c40_de31_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2874_c40_de31_return_output := jmi_uxn_opcodes_h_l2874_c40_de31_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_ab02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_f20b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output;
     VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_f20b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue := VAR_jmi_uxn_opcodes_h_l2874_c40_de31_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_c233] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_4bfe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output;

     -- jsi[uxn_opcodes_h_l2875_c40_5b65] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2875_c40_5b65_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2875_c40_5b65_phase <= VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_phase;
     jsi_uxn_opcodes_h_l2875_c40_5b65_pc <= VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_pc;
     jsi_uxn_opcodes_h_l2875_c40_5b65_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_return_output := jsi_uxn_opcodes_h_l2875_c40_5b65_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output;
     VAR_lit_uxn_opcodes_h_l2876_c40_1900_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_c233_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue := VAR_jsi_uxn_opcodes_h_l2875_c40_5b65_return_output;
     -- lit[uxn_opcodes_h_l2876_c40_1900] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2876_c40_1900_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2876_c40_1900_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2876_c40_1900_phase <= VAR_lit_uxn_opcodes_h_l2876_c40_1900_phase;
     lit_uxn_opcodes_h_l2876_c40_1900_pc <= VAR_lit_uxn_opcodes_h_l2876_c40_1900_pc;
     lit_uxn_opcodes_h_l2876_c40_1900_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2876_c40_1900_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2876_c40_1900_return_output := lit_uxn_opcodes_h_l2876_c40_1900_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_c804] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_39b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output;
     VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c804_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue := VAR_lit_uxn_opcodes_h_l2876_c40_1900_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_eb26] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_return_output;

     -- lit2[uxn_opcodes_h_l2877_c40_c47e] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2877_c40_c47e_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2877_c40_c47e_phase <= VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_phase;
     lit2_uxn_opcodes_h_l2877_c40_c47e_pc <= VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_pc;
     lit2_uxn_opcodes_h_l2877_c40_c47e_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_return_output := lit2_uxn_opcodes_h_l2877_c40_c47e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_3b37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output;
     VAR_lit_uxn_opcodes_h_l2878_c40_b870_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_eb26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue := VAR_lit2_uxn_opcodes_h_l2877_c40_c47e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_0118] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_847c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_return_output;

     -- lit[uxn_opcodes_h_l2878_c40_b870] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2878_c40_b870_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2878_c40_b870_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2878_c40_b870_phase <= VAR_lit_uxn_opcodes_h_l2878_c40_b870_phase;
     lit_uxn_opcodes_h_l2878_c40_b870_pc <= VAR_lit_uxn_opcodes_h_l2878_c40_b870_pc;
     lit_uxn_opcodes_h_l2878_c40_b870_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2878_c40_b870_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2878_c40_b870_return_output := lit_uxn_opcodes_h_l2878_c40_b870_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_0118_return_output;
     VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_847c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue := VAR_lit_uxn_opcodes_h_l2878_c40_b870_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_5c2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_fcf8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output;

     -- lit2[uxn_opcodes_h_l2879_c40_ab18] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2879_c40_ab18_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2879_c40_ab18_phase <= VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_phase;
     lit2_uxn_opcodes_h_l2879_c40_ab18_pc <= VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_pc;
     lit2_uxn_opcodes_h_l2879_c40_ab18_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_return_output := lit2_uxn_opcodes_h_l2879_c40_ab18_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output;
     VAR_inc_uxn_opcodes_h_l2880_c40_6843_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_5c2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue := VAR_lit2_uxn_opcodes_h_l2879_c40_ab18_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_86d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output;

     -- inc[uxn_opcodes_h_l2880_c40_6843] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2880_c40_6843_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2880_c40_6843_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2880_c40_6843_phase <= VAR_inc_uxn_opcodes_h_l2880_c40_6843_phase;
     inc_uxn_opcodes_h_l2880_c40_6843_ins <= VAR_inc_uxn_opcodes_h_l2880_c40_6843_ins;
     inc_uxn_opcodes_h_l2880_c40_6843_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2880_c40_6843_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2880_c40_6843_return_output := inc_uxn_opcodes_h_l2880_c40_6843_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_4694] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output;
     VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_4694_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue := VAR_inc_uxn_opcodes_h_l2880_c40_6843_return_output;
     -- inc2[uxn_opcodes_h_l2881_c40_85e8] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2881_c40_85e8_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2881_c40_85e8_phase <= VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_phase;
     inc2_uxn_opcodes_h_l2881_c40_85e8_ins <= VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_ins;
     inc2_uxn_opcodes_h_l2881_c40_85e8_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_return_output := inc2_uxn_opcodes_h_l2881_c40_85e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_9be6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_f88f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output;
     VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_9be6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue := VAR_inc2_uxn_opcodes_h_l2881_c40_85e8_return_output;
     -- pop[uxn_opcodes_h_l2882_c40_9bb6] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2882_c40_9bb6_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2882_c40_9bb6_phase <= VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_phase;
     pop_uxn_opcodes_h_l2882_c40_9bb6_ins <= VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_return_output := pop_uxn_opcodes_h_l2882_c40_9bb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_9d54] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_5b58] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output;
     VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5b58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue := VAR_pop_uxn_opcodes_h_l2882_c40_9bb6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_7a00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_c864] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_return_output;

     -- pop2[uxn_opcodes_h_l2883_c40_7c0c] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2883_c40_7c0c_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2883_c40_7c0c_phase <= VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_phase;
     pop2_uxn_opcodes_h_l2883_c40_7c0c_ins <= VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_return_output := pop2_uxn_opcodes_h_l2883_c40_7c0c_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output;
     VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_c864_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue := VAR_pop2_uxn_opcodes_h_l2883_c40_7c0c_return_output;
     -- nip[uxn_opcodes_h_l2884_c40_e8b5] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2884_c40_e8b5_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2884_c40_e8b5_phase <= VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_phase;
     nip_uxn_opcodes_h_l2884_c40_e8b5_ins <= VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_ins;
     nip_uxn_opcodes_h_l2884_c40_e8b5_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_return_output := nip_uxn_opcodes_h_l2884_c40_e8b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_78c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_51c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output;
     VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_51c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue := VAR_nip_uxn_opcodes_h_l2884_c40_e8b5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_22b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_6fb7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_return_output;

     -- nip2[uxn_opcodes_h_l2885_c40_6bb2] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2885_c40_6bb2_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2885_c40_6bb2_phase <= VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_phase;
     nip2_uxn_opcodes_h_l2885_c40_6bb2_ins <= VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_ins;
     nip2_uxn_opcodes_h_l2885_c40_6bb2_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_return_output := nip2_uxn_opcodes_h_l2885_c40_6bb2_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output;
     VAR_swp_uxn_opcodes_h_l2886_c40_ec11_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_6fb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue := VAR_nip2_uxn_opcodes_h_l2885_c40_6bb2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_a304] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_return_output;

     -- swp[uxn_opcodes_h_l2886_c40_ec11] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2886_c40_ec11_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2886_c40_ec11_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2886_c40_ec11_phase <= VAR_swp_uxn_opcodes_h_l2886_c40_ec11_phase;
     swp_uxn_opcodes_h_l2886_c40_ec11_ins <= VAR_swp_uxn_opcodes_h_l2886_c40_ec11_ins;
     swp_uxn_opcodes_h_l2886_c40_ec11_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2886_c40_ec11_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2886_c40_ec11_return_output := swp_uxn_opcodes_h_l2886_c40_ec11_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_97cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output;
     VAR_swp2_uxn_opcodes_h_l2887_c40_6743_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_a304_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue := VAR_swp_uxn_opcodes_h_l2886_c40_ec11_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_0810] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_return_output;

     -- swp2[uxn_opcodes_h_l2887_c40_6743] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2887_c40_6743_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2887_c40_6743_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2887_c40_6743_phase <= VAR_swp2_uxn_opcodes_h_l2887_c40_6743_phase;
     swp2_uxn_opcodes_h_l2887_c40_6743_ins <= VAR_swp2_uxn_opcodes_h_l2887_c40_6743_ins;
     swp2_uxn_opcodes_h_l2887_c40_6743_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2887_c40_6743_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2887_c40_6743_return_output := swp2_uxn_opcodes_h_l2887_c40_6743_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_0a06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output;
     VAR_rot_uxn_opcodes_h_l2888_c40_8292_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_0810_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue := VAR_swp2_uxn_opcodes_h_l2887_c40_6743_return_output;
     -- rot[uxn_opcodes_h_l2888_c40_8292] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2888_c40_8292_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2888_c40_8292_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2888_c40_8292_phase <= VAR_rot_uxn_opcodes_h_l2888_c40_8292_phase;
     rot_uxn_opcodes_h_l2888_c40_8292_ins <= VAR_rot_uxn_opcodes_h_l2888_c40_8292_ins;
     rot_uxn_opcodes_h_l2888_c40_8292_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2888_c40_8292_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2888_c40_8292_return_output := rot_uxn_opcodes_h_l2888_c40_8292_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_988b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_2c67] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output;
     VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_988b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue := VAR_rot_uxn_opcodes_h_l2888_c40_8292_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_e234] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output;

     -- rot2[uxn_opcodes_h_l2889_c40_a7c6] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2889_c40_a7c6_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2889_c40_a7c6_phase <= VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_phase;
     rot2_uxn_opcodes_h_l2889_c40_a7c6_ins <= VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_ins;
     rot2_uxn_opcodes_h_l2889_c40_a7c6_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_return_output := rot2_uxn_opcodes_h_l2889_c40_a7c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_d212] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_e234_return_output;
     VAR_dup_uxn_opcodes_h_l2890_c40_46c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_d212_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue := VAR_rot2_uxn_opcodes_h_l2889_c40_a7c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_e54f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_return_output;

     -- dup[uxn_opcodes_h_l2890_c40_46c6] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2890_c40_46c6_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2890_c40_46c6_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2890_c40_46c6_phase <= VAR_dup_uxn_opcodes_h_l2890_c40_46c6_phase;
     dup_uxn_opcodes_h_l2890_c40_46c6_ins <= VAR_dup_uxn_opcodes_h_l2890_c40_46c6_ins;
     dup_uxn_opcodes_h_l2890_c40_46c6_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2890_c40_46c6_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2890_c40_46c6_return_output := dup_uxn_opcodes_h_l2890_c40_46c6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_23f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output;
     VAR_dup2_uxn_opcodes_h_l2891_c40_400a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_e54f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue := VAR_dup_uxn_opcodes_h_l2890_c40_46c6_return_output;
     -- dup2[uxn_opcodes_h_l2891_c40_400a] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2891_c40_400a_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2891_c40_400a_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2891_c40_400a_phase <= VAR_dup2_uxn_opcodes_h_l2891_c40_400a_phase;
     dup2_uxn_opcodes_h_l2891_c40_400a_ins <= VAR_dup2_uxn_opcodes_h_l2891_c40_400a_ins;
     dup2_uxn_opcodes_h_l2891_c40_400a_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2891_c40_400a_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2891_c40_400a_return_output := dup2_uxn_opcodes_h_l2891_c40_400a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_1234] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_2c37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output;
     VAR_ovr_uxn_opcodes_h_l2892_c40_961b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_1234_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue := VAR_dup2_uxn_opcodes_h_l2891_c40_400a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_3334] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output;

     -- ovr[uxn_opcodes_h_l2892_c40_961b] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2892_c40_961b_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2892_c40_961b_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2892_c40_961b_phase <= VAR_ovr_uxn_opcodes_h_l2892_c40_961b_phase;
     ovr_uxn_opcodes_h_l2892_c40_961b_ins <= VAR_ovr_uxn_opcodes_h_l2892_c40_961b_ins;
     ovr_uxn_opcodes_h_l2892_c40_961b_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2892_c40_961b_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2892_c40_961b_return_output := ovr_uxn_opcodes_h_l2892_c40_961b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_3016] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_3334_return_output;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3016_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue := VAR_ovr_uxn_opcodes_h_l2892_c40_961b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_2b56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output;

     -- ovr2[uxn_opcodes_h_l2893_c40_1de2] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2893_c40_1de2_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2893_c40_1de2_phase <= VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_phase;
     ovr2_uxn_opcodes_h_l2893_c40_1de2_ins <= VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_ins;
     ovr2_uxn_opcodes_h_l2893_c40_1de2_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_return_output := ovr2_uxn_opcodes_h_l2893_c40_1de2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_533f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output;
     VAR_equ_uxn_opcodes_h_l2894_c40_4448_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_533f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue := VAR_ovr2_uxn_opcodes_h_l2893_c40_1de2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_1697] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output;

     -- equ[uxn_opcodes_h_l2894_c40_4448] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2894_c40_4448_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2894_c40_4448_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2894_c40_4448_phase <= VAR_equ_uxn_opcodes_h_l2894_c40_4448_phase;
     equ_uxn_opcodes_h_l2894_c40_4448_ins <= VAR_equ_uxn_opcodes_h_l2894_c40_4448_ins;
     equ_uxn_opcodes_h_l2894_c40_4448_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2894_c40_4448_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2894_c40_4448_return_output := equ_uxn_opcodes_h_l2894_c40_4448_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_bad4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_1697_return_output;
     VAR_equ2_uxn_opcodes_h_l2895_c40_b755_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_bad4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue := VAR_equ_uxn_opcodes_h_l2894_c40_4448_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_b5d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output;

     -- equ2[uxn_opcodes_h_l2895_c40_b755] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2895_c40_b755_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2895_c40_b755_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2895_c40_b755_phase <= VAR_equ2_uxn_opcodes_h_l2895_c40_b755_phase;
     equ2_uxn_opcodes_h_l2895_c40_b755_ins <= VAR_equ2_uxn_opcodes_h_l2895_c40_b755_ins;
     equ2_uxn_opcodes_h_l2895_c40_b755_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2895_c40_b755_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2895_c40_b755_return_output := equ2_uxn_opcodes_h_l2895_c40_b755_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_4169] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output;
     VAR_neq_uxn_opcodes_h_l2896_c40_76a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_4169_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue := VAR_equ2_uxn_opcodes_h_l2895_c40_b755_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_5bfc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_return_output;

     -- neq[uxn_opcodes_h_l2896_c40_76a5] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2896_c40_76a5_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2896_c40_76a5_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2896_c40_76a5_phase <= VAR_neq_uxn_opcodes_h_l2896_c40_76a5_phase;
     neq_uxn_opcodes_h_l2896_c40_76a5_ins <= VAR_neq_uxn_opcodes_h_l2896_c40_76a5_ins;
     neq_uxn_opcodes_h_l2896_c40_76a5_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2896_c40_76a5_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2896_c40_76a5_return_output := neq_uxn_opcodes_h_l2896_c40_76a5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_9668] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_9668_return_output;
     VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5bfc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue := VAR_neq_uxn_opcodes_h_l2896_c40_76a5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_5ea9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_ef42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output;

     -- neq2[uxn_opcodes_h_l2897_c40_3b32] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2897_c40_3b32_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2897_c40_3b32_phase <= VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_phase;
     neq2_uxn_opcodes_h_l2897_c40_3b32_ins <= VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_ins;
     neq2_uxn_opcodes_h_l2897_c40_3b32_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_return_output := neq2_uxn_opcodes_h_l2897_c40_3b32_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output;
     VAR_gth_uxn_opcodes_h_l2898_c40_3582_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5ea9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue := VAR_neq2_uxn_opcodes_h_l2897_c40_3b32_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_4b7d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_return_output;

     -- gth[uxn_opcodes_h_l2898_c40_3582] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2898_c40_3582_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2898_c40_3582_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2898_c40_3582_phase <= VAR_gth_uxn_opcodes_h_l2898_c40_3582_phase;
     gth_uxn_opcodes_h_l2898_c40_3582_ins <= VAR_gth_uxn_opcodes_h_l2898_c40_3582_ins;
     gth_uxn_opcodes_h_l2898_c40_3582_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2898_c40_3582_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2898_c40_3582_return_output := gth_uxn_opcodes_h_l2898_c40_3582_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_1a20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output;
     VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_4b7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue := VAR_gth_uxn_opcodes_h_l2898_c40_3582_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_b6d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_3dc4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_return_output;

     -- gth2[uxn_opcodes_h_l2899_c40_6f72] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2899_c40_6f72_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2899_c40_6f72_phase <= VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_phase;
     gth2_uxn_opcodes_h_l2899_c40_6f72_ins <= VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_ins;
     gth2_uxn_opcodes_h_l2899_c40_6f72_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_return_output := gth2_uxn_opcodes_h_l2899_c40_6f72_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output;
     VAR_lth_uxn_opcodes_h_l2900_c40_ff91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3dc4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue := VAR_gth2_uxn_opcodes_h_l2899_c40_6f72_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_3be8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_return_output;

     -- lth[uxn_opcodes_h_l2900_c40_ff91] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2900_c40_ff91_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2900_c40_ff91_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2900_c40_ff91_phase <= VAR_lth_uxn_opcodes_h_l2900_c40_ff91_phase;
     lth_uxn_opcodes_h_l2900_c40_ff91_ins <= VAR_lth_uxn_opcodes_h_l2900_c40_ff91_ins;
     lth_uxn_opcodes_h_l2900_c40_ff91_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2900_c40_ff91_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2900_c40_ff91_return_output := lth_uxn_opcodes_h_l2900_c40_ff91_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_e62e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output;
     VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_3be8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue := VAR_lth_uxn_opcodes_h_l2900_c40_ff91_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_8b7c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_657e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output;

     -- lth2[uxn_opcodes_h_l2901_c40_5d3d] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2901_c40_5d3d_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2901_c40_5d3d_phase <= VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_phase;
     lth2_uxn_opcodes_h_l2901_c40_5d3d_ins <= VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_ins;
     lth2_uxn_opcodes_h_l2901_c40_5d3d_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_return_output := lth2_uxn_opcodes_h_l2901_c40_5d3d_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_657e_return_output;
     VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_8b7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue := VAR_lth2_uxn_opcodes_h_l2901_c40_5d3d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_a04f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_return_output;

     -- jmp[uxn_opcodes_h_l2902_c40_0e1d] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2902_c40_0e1d_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2902_c40_0e1d_phase <= VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_phase;
     jmp_uxn_opcodes_h_l2902_c40_0e1d_ins <= VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_ins;
     jmp_uxn_opcodes_h_l2902_c40_0e1d_pc <= VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_pc;
     jmp_uxn_opcodes_h_l2902_c40_0e1d_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_return_output := jmp_uxn_opcodes_h_l2902_c40_0e1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_8107] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8107_return_output;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a04f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue := VAR_jmp_uxn_opcodes_h_l2902_c40_0e1d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_85f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0a1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output;

     -- jmp2[uxn_opcodes_h_l2903_c40_a7db] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2903_c40_a7db_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2903_c40_a7db_phase <= VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_phase;
     jmp2_uxn_opcodes_h_l2903_c40_a7db_ins <= VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_ins;
     jmp2_uxn_opcodes_h_l2903_c40_a7db_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_return_output := jmp2_uxn_opcodes_h_l2903_c40_a7db_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output;
     VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_85f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue := VAR_jmp2_uxn_opcodes_h_l2903_c40_a7db_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_4a69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_5781] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_return_output;

     -- jcn[uxn_opcodes_h_l2904_c40_47a4] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2904_c40_47a4_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2904_c40_47a4_phase <= VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_phase;
     jcn_uxn_opcodes_h_l2904_c40_47a4_ins <= VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_ins;
     jcn_uxn_opcodes_h_l2904_c40_47a4_pc <= VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_pc;
     jcn_uxn_opcodes_h_l2904_c40_47a4_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_return_output := jcn_uxn_opcodes_h_l2904_c40_47a4_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_5781_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue := VAR_jcn_uxn_opcodes_h_l2904_c40_47a4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_3694] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_c8de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_return_output;

     -- jcn2[uxn_opcodes_h_l2905_c40_7f93] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2905_c40_7f93_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2905_c40_7f93_phase <= VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_phase;
     jcn2_uxn_opcodes_h_l2905_c40_7f93_ins <= VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_ins;
     jcn2_uxn_opcodes_h_l2905_c40_7f93_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_return_output := jcn2_uxn_opcodes_h_l2905_c40_7f93_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_3694_return_output;
     VAR_jsr_uxn_opcodes_h_l2906_c40_a423_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_c8de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue := VAR_jcn2_uxn_opcodes_h_l2905_c40_7f93_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_2e01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_dfdf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_return_output;

     -- jsr[uxn_opcodes_h_l2906_c40_a423] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2906_c40_a423_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2906_c40_a423_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2906_c40_a423_phase <= VAR_jsr_uxn_opcodes_h_l2906_c40_a423_phase;
     jsr_uxn_opcodes_h_l2906_c40_a423_ins <= VAR_jsr_uxn_opcodes_h_l2906_c40_a423_ins;
     jsr_uxn_opcodes_h_l2906_c40_a423_pc <= VAR_jsr_uxn_opcodes_h_l2906_c40_a423_pc;
     jsr_uxn_opcodes_h_l2906_c40_a423_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2906_c40_a423_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2906_c40_a423_return_output := jsr_uxn_opcodes_h_l2906_c40_a423_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_dfdf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue := VAR_jsr_uxn_opcodes_h_l2906_c40_a423_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_e71f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_14de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_return_output;

     -- jsr2[uxn_opcodes_h_l2907_c40_4e6f] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2907_c40_4e6f_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2907_c40_4e6f_phase <= VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_phase;
     jsr2_uxn_opcodes_h_l2907_c40_4e6f_ins <= VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_ins;
     jsr2_uxn_opcodes_h_l2907_c40_4e6f_pc <= VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_pc;
     jsr2_uxn_opcodes_h_l2907_c40_4e6f_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_return_output := jsr2_uxn_opcodes_h_l2907_c40_4e6f_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output;
     VAR_sth_uxn_opcodes_h_l2908_c40_bf35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_14de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue := VAR_jsr2_uxn_opcodes_h_l2907_c40_4e6f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_1566] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_baa1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output;

     -- sth[uxn_opcodes_h_l2908_c40_bf35] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2908_c40_bf35_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2908_c40_bf35_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2908_c40_bf35_phase <= VAR_sth_uxn_opcodes_h_l2908_c40_bf35_phase;
     sth_uxn_opcodes_h_l2908_c40_bf35_ins <= VAR_sth_uxn_opcodes_h_l2908_c40_bf35_ins;
     sth_uxn_opcodes_h_l2908_c40_bf35_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2908_c40_bf35_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2908_c40_bf35_return_output := sth_uxn_opcodes_h_l2908_c40_bf35_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output;
     VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_1566_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue := VAR_sth_uxn_opcodes_h_l2908_c40_bf35_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_abd1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_return_output;

     -- sth2[uxn_opcodes_h_l2909_c40_f4c3] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2909_c40_f4c3_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2909_c40_f4c3_phase <= VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_phase;
     sth2_uxn_opcodes_h_l2909_c40_f4c3_ins <= VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_ins;
     sth2_uxn_opcodes_h_l2909_c40_f4c3_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_return_output := sth2_uxn_opcodes_h_l2909_c40_f4c3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_441a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_441a_return_output;
     VAR_ldz_uxn_opcodes_h_l2910_c40_5852_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_abd1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue := VAR_sth2_uxn_opcodes_h_l2909_c40_f4c3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_6ded] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_return_output;

     -- ldz[uxn_opcodes_h_l2910_c40_5852] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2910_c40_5852_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2910_c40_5852_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2910_c40_5852_phase <= VAR_ldz_uxn_opcodes_h_l2910_c40_5852_phase;
     ldz_uxn_opcodes_h_l2910_c40_5852_ins <= VAR_ldz_uxn_opcodes_h_l2910_c40_5852_ins;
     ldz_uxn_opcodes_h_l2910_c40_5852_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_5852_previous_stack_read;
     ldz_uxn_opcodes_h_l2910_c40_5852_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_5852_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2910_c40_5852_return_output := ldz_uxn_opcodes_h_l2910_c40_5852_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_e3ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_6ded_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue := VAR_ldz_uxn_opcodes_h_l2910_c40_5852_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_f183] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output;

     -- ldz2[uxn_opcodes_h_l2911_c40_4580] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2911_c40_4580_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2911_c40_4580_phase <= VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_phase;
     ldz2_uxn_opcodes_h_l2911_c40_4580_ins <= VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_ins;
     ldz2_uxn_opcodes_h_l2911_c40_4580_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_previous_stack_read;
     ldz2_uxn_opcodes_h_l2911_c40_4580_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_return_output := ldz2_uxn_opcodes_h_l2911_c40_4580_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_4370] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f183_return_output;
     VAR_stz_uxn_opcodes_h_l2912_c40_7886_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_4370_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue := VAR_ldz2_uxn_opcodes_h_l2911_c40_4580_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_de6c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_return_output;

     -- stz[uxn_opcodes_h_l2912_c40_7886] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2912_c40_7886_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2912_c40_7886_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2912_c40_7886_phase <= VAR_stz_uxn_opcodes_h_l2912_c40_7886_phase;
     stz_uxn_opcodes_h_l2912_c40_7886_ins <= VAR_stz_uxn_opcodes_h_l2912_c40_7886_ins;
     stz_uxn_opcodes_h_l2912_c40_7886_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2912_c40_7886_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2912_c40_7886_return_output := stz_uxn_opcodes_h_l2912_c40_7886_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_99a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output;
     VAR_stz2_uxn_opcodes_h_l2913_c40_552e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_de6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue := VAR_stz_uxn_opcodes_h_l2912_c40_7886_return_output;
     -- stz2[uxn_opcodes_h_l2913_c40_552e] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2913_c40_552e_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2913_c40_552e_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2913_c40_552e_phase <= VAR_stz2_uxn_opcodes_h_l2913_c40_552e_phase;
     stz2_uxn_opcodes_h_l2913_c40_552e_ins <= VAR_stz2_uxn_opcodes_h_l2913_c40_552e_ins;
     stz2_uxn_opcodes_h_l2913_c40_552e_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2913_c40_552e_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2913_c40_552e_return_output := stz2_uxn_opcodes_h_l2913_c40_552e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_8f56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_710d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_710d_return_output;
     VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_8f56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue := VAR_stz2_uxn_opcodes_h_l2913_c40_552e_return_output;
     -- ldr[uxn_opcodes_h_l2914_c40_33f4] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2914_c40_33f4_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2914_c40_33f4_phase <= VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_phase;
     ldr_uxn_opcodes_h_l2914_c40_33f4_ins <= VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_ins;
     ldr_uxn_opcodes_h_l2914_c40_33f4_pc <= VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_pc;
     ldr_uxn_opcodes_h_l2914_c40_33f4_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_previous_stack_read;
     ldr_uxn_opcodes_h_l2914_c40_33f4_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_return_output := ldr_uxn_opcodes_h_l2914_c40_33f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_02a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_a761] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a761_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue := VAR_ldr_uxn_opcodes_h_l2914_c40_33f4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_dbce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output;

     -- ldr2[uxn_opcodes_h_l2915_c40_018f] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2915_c40_018f_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2915_c40_018f_phase <= VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_phase;
     ldr2_uxn_opcodes_h_l2915_c40_018f_ins <= VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_ins;
     ldr2_uxn_opcodes_h_l2915_c40_018f_pc <= VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_pc;
     ldr2_uxn_opcodes_h_l2915_c40_018f_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_previous_stack_read;
     ldr2_uxn_opcodes_h_l2915_c40_018f_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_return_output := ldr2_uxn_opcodes_h_l2915_c40_018f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_c4ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output;
     VAR_str1_uxn_opcodes_h_l2916_c40_3c55_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c4ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue := VAR_ldr2_uxn_opcodes_h_l2915_c40_018f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8a8e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_a132] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_return_output;

     -- str1[uxn_opcodes_h_l2916_c40_3c55] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2916_c40_3c55_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2916_c40_3c55_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2916_c40_3c55_phase <= VAR_str1_uxn_opcodes_h_l2916_c40_3c55_phase;
     str1_uxn_opcodes_h_l2916_c40_3c55_ins <= VAR_str1_uxn_opcodes_h_l2916_c40_3c55_ins;
     str1_uxn_opcodes_h_l2916_c40_3c55_pc <= VAR_str1_uxn_opcodes_h_l2916_c40_3c55_pc;
     str1_uxn_opcodes_h_l2916_c40_3c55_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2916_c40_3c55_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2916_c40_3c55_return_output := str1_uxn_opcodes_h_l2916_c40_3c55_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output;
     VAR_str2_uxn_opcodes_h_l2917_c40_2109_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_a132_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue := VAR_str1_uxn_opcodes_h_l2916_c40_3c55_return_output;
     -- str2[uxn_opcodes_h_l2917_c40_2109] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2917_c40_2109_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2917_c40_2109_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2917_c40_2109_phase <= VAR_str2_uxn_opcodes_h_l2917_c40_2109_phase;
     str2_uxn_opcodes_h_l2917_c40_2109_ins <= VAR_str2_uxn_opcodes_h_l2917_c40_2109_ins;
     str2_uxn_opcodes_h_l2917_c40_2109_pc <= VAR_str2_uxn_opcodes_h_l2917_c40_2109_pc;
     str2_uxn_opcodes_h_l2917_c40_2109_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2917_c40_2109_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2917_c40_2109_return_output := str2_uxn_opcodes_h_l2917_c40_2109_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_64d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_75a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output;
     VAR_lda_uxn_opcodes_h_l2918_c40_c0da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue := VAR_str2_uxn_opcodes_h_l2917_c40_2109_return_output;
     -- lda[uxn_opcodes_h_l2918_c40_c0da] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2918_c40_c0da_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2918_c40_c0da_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2918_c40_c0da_phase <= VAR_lda_uxn_opcodes_h_l2918_c40_c0da_phase;
     lda_uxn_opcodes_h_l2918_c40_c0da_ins <= VAR_lda_uxn_opcodes_h_l2918_c40_c0da_ins;
     lda_uxn_opcodes_h_l2918_c40_c0da_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2918_c40_c0da_previous_stack_read;
     lda_uxn_opcodes_h_l2918_c40_c0da_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2918_c40_c0da_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2918_c40_c0da_return_output := lda_uxn_opcodes_h_l2918_c40_c0da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_d24b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_c34a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output;
     VAR_lda2_uxn_opcodes_h_l2919_c40_882a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_d24b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue := VAR_lda_uxn_opcodes_h_l2918_c40_c0da_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_632e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_return_output;

     -- lda2[uxn_opcodes_h_l2919_c40_882a] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2919_c40_882a_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2919_c40_882a_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2919_c40_882a_phase <= VAR_lda2_uxn_opcodes_h_l2919_c40_882a_phase;
     lda2_uxn_opcodes_h_l2919_c40_882a_ins <= VAR_lda2_uxn_opcodes_h_l2919_c40_882a_ins;
     lda2_uxn_opcodes_h_l2919_c40_882a_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_882a_previous_stack_read;
     lda2_uxn_opcodes_h_l2919_c40_882a_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_882a_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2919_c40_882a_return_output := lda2_uxn_opcodes_h_l2919_c40_882a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_ecea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output;
     VAR_sta_uxn_opcodes_h_l2920_c40_cb83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_632e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue := VAR_lda2_uxn_opcodes_h_l2919_c40_882a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_4b5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_940b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output;

     -- sta[uxn_opcodes_h_l2920_c40_cb83] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2920_c40_cb83_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2920_c40_cb83_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2920_c40_cb83_phase <= VAR_sta_uxn_opcodes_h_l2920_c40_cb83_phase;
     sta_uxn_opcodes_h_l2920_c40_cb83_ins <= VAR_sta_uxn_opcodes_h_l2920_c40_cb83_ins;
     sta_uxn_opcodes_h_l2920_c40_cb83_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2920_c40_cb83_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2920_c40_cb83_return_output := sta_uxn_opcodes_h_l2920_c40_cb83_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_940b_return_output;
     VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_4b5d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue := VAR_sta_uxn_opcodes_h_l2920_c40_cb83_return_output;
     -- sta2[uxn_opcodes_h_l2921_c40_c7d0] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2921_c40_c7d0_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2921_c40_c7d0_phase <= VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_phase;
     sta2_uxn_opcodes_h_l2921_c40_c7d0_ins <= VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_ins;
     sta2_uxn_opcodes_h_l2921_c40_c7d0_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_return_output := sta2_uxn_opcodes_h_l2921_c40_c7d0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_2925] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_a273] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_2925_return_output;
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_a273_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue := VAR_sta2_uxn_opcodes_h_l2921_c40_c7d0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_111d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_return_output;

     -- dei[uxn_opcodes_h_l2922_c40_63e9] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2922_c40_63e9_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2922_c40_63e9_phase <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_phase;
     dei_uxn_opcodes_h_l2922_c40_63e9_ins <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_ins;
     dei_uxn_opcodes_h_l2922_c40_63e9_controller0_buttons <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_controller0_buttons;
     dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr0 <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr0;
     dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr1 <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_stack_ptr1;
     dei_uxn_opcodes_h_l2922_c40_63e9_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_previous_stack_read;
     dei_uxn_opcodes_h_l2922_c40_63e9_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2922_c40_63e9_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2922_c40_63e9_return_output := dei_uxn_opcodes_h_l2922_c40_63e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_ab74] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output;
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_111d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue := VAR_dei_uxn_opcodes_h_l2922_c40_63e9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_9e97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output;

     -- dei2[uxn_opcodes_h_l2923_c40_10cf] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2923_c40_10cf_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2923_c40_10cf_phase <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_phase;
     dei2_uxn_opcodes_h_l2923_c40_10cf_ins <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_ins;
     dei2_uxn_opcodes_h_l2923_c40_10cf_controller0_buttons <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_controller0_buttons;
     dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr0 <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr0;
     dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr1 <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_stack_ptr1;
     dei2_uxn_opcodes_h_l2923_c40_10cf_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_previous_stack_read;
     dei2_uxn_opcodes_h_l2923_c40_10cf_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_return_output := dei2_uxn_opcodes_h_l2923_c40_10cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_d262] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output;
     VAR_deo_uxn_opcodes_h_l2924_c40_9287_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_d262_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue := VAR_dei2_uxn_opcodes_h_l2923_c40_10cf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_1f88] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_253c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_return_output;

     -- deo[uxn_opcodes_h_l2924_c40_9287] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2924_c40_9287_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2924_c40_9287_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2924_c40_9287_phase <= VAR_deo_uxn_opcodes_h_l2924_c40_9287_phase;
     deo_uxn_opcodes_h_l2924_c40_9287_ins <= VAR_deo_uxn_opcodes_h_l2924_c40_9287_ins;
     deo_uxn_opcodes_h_l2924_c40_9287_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_stack_read;
     deo_uxn_opcodes_h_l2924_c40_9287_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_device_ram_read;
     deo_uxn_opcodes_h_l2924_c40_9287_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_9287_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2924_c40_9287_return_output := deo_uxn_opcodes_h_l2924_c40_9287_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output;
     VAR_deo2_uxn_opcodes_h_l2925_c40_beda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_253c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue := VAR_deo_uxn_opcodes_h_l2924_c40_9287_return_output;
     -- deo2[uxn_opcodes_h_l2925_c40_beda] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2925_c40_beda_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2925_c40_beda_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2925_c40_beda_phase <= VAR_deo2_uxn_opcodes_h_l2925_c40_beda_phase;
     deo2_uxn_opcodes_h_l2925_c40_beda_ins <= VAR_deo2_uxn_opcodes_h_l2925_c40_beda_ins;
     deo2_uxn_opcodes_h_l2925_c40_beda_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_stack_read;
     deo2_uxn_opcodes_h_l2925_c40_beda_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2925_c40_beda_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_beda_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2925_c40_beda_return_output := deo2_uxn_opcodes_h_l2925_c40_beda_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_d469] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_c87c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_d469_return_output;
     VAR_add_uxn_opcodes_h_l2926_c40_e989_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c87c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue := VAR_deo2_uxn_opcodes_h_l2925_c40_beda_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_861d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_4846] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_return_output;

     -- add[uxn_opcodes_h_l2926_c40_e989] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2926_c40_e989_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2926_c40_e989_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2926_c40_e989_phase <= VAR_add_uxn_opcodes_h_l2926_c40_e989_phase;
     add_uxn_opcodes_h_l2926_c40_e989_ins <= VAR_add_uxn_opcodes_h_l2926_c40_e989_ins;
     add_uxn_opcodes_h_l2926_c40_e989_previous_stack_read <= VAR_add_uxn_opcodes_h_l2926_c40_e989_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2926_c40_e989_return_output := add_uxn_opcodes_h_l2926_c40_e989_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_861d_return_output;
     VAR_add2_uxn_opcodes_h_l2927_c40_f98d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_4846_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue := VAR_add_uxn_opcodes_h_l2926_c40_e989_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_05d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_return_output;

     -- add2[uxn_opcodes_h_l2927_c40_f98d] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2927_c40_f98d_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2927_c40_f98d_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2927_c40_f98d_phase <= VAR_add2_uxn_opcodes_h_l2927_c40_f98d_phase;
     add2_uxn_opcodes_h_l2927_c40_f98d_ins <= VAR_add2_uxn_opcodes_h_l2927_c40_f98d_ins;
     add2_uxn_opcodes_h_l2927_c40_f98d_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2927_c40_f98d_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2927_c40_f98d_return_output := add2_uxn_opcodes_h_l2927_c40_f98d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_be48] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_be48_return_output;
     VAR_sub1_uxn_opcodes_h_l2928_c40_698d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_05d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue := VAR_add2_uxn_opcodes_h_l2927_c40_f98d_return_output;
     -- sub1[uxn_opcodes_h_l2928_c40_698d] LATENCY=0
     -- Clock enable
     sub1_uxn_opcodes_h_l2928_c40_698d_CLOCK_ENABLE <= VAR_sub1_uxn_opcodes_h_l2928_c40_698d_CLOCK_ENABLE;
     -- Inputs
     sub1_uxn_opcodes_h_l2928_c40_698d_phase <= VAR_sub1_uxn_opcodes_h_l2928_c40_698d_phase;
     sub1_uxn_opcodes_h_l2928_c40_698d_ins <= VAR_sub1_uxn_opcodes_h_l2928_c40_698d_ins;
     sub1_uxn_opcodes_h_l2928_c40_698d_previous_stack_read <= VAR_sub1_uxn_opcodes_h_l2928_c40_698d_previous_stack_read;
     -- Outputs
     VAR_sub1_uxn_opcodes_h_l2928_c40_698d_return_output := sub1_uxn_opcodes_h_l2928_c40_698d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_c3b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_80f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output;
     VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c3b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue := VAR_sub1_uxn_opcodes_h_l2928_c40_698d_return_output;
     -- sub2[uxn_opcodes_h_l2929_c40_ac6a] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2929_c40_ac6a_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2929_c40_ac6a_phase <= VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_phase;
     sub2_uxn_opcodes_h_l2929_c40_ac6a_ins <= VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_ins;
     sub2_uxn_opcodes_h_l2929_c40_ac6a_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_return_output := sub2_uxn_opcodes_h_l2929_c40_ac6a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_dd7a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_2738] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2738_return_output;
     VAR_mul_uxn_opcodes_h_l2930_c40_e9da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_dd7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue := VAR_sub2_uxn_opcodes_h_l2929_c40_ac6a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_e649] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output;

     -- mul[uxn_opcodes_h_l2930_c40_e9da] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2930_c40_e9da_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2930_c40_e9da_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2930_c40_e9da_phase <= VAR_mul_uxn_opcodes_h_l2930_c40_e9da_phase;
     mul_uxn_opcodes_h_l2930_c40_e9da_ins <= VAR_mul_uxn_opcodes_h_l2930_c40_e9da_ins;
     mul_uxn_opcodes_h_l2930_c40_e9da_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2930_c40_e9da_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2930_c40_e9da_return_output := mul_uxn_opcodes_h_l2930_c40_e9da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_5a33] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e649_return_output;
     VAR_mul2_uxn_opcodes_h_l2931_c40_c686_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5a33_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue := VAR_mul_uxn_opcodes_h_l2930_c40_e9da_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_c7f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_6315] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output;

     -- mul2[uxn_opcodes_h_l2931_c40_c686] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2931_c40_c686_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2931_c40_c686_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2931_c40_c686_phase <= VAR_mul2_uxn_opcodes_h_l2931_c40_c686_phase;
     mul2_uxn_opcodes_h_l2931_c40_c686_ins <= VAR_mul2_uxn_opcodes_h_l2931_c40_c686_ins;
     mul2_uxn_opcodes_h_l2931_c40_c686_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2931_c40_c686_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2931_c40_c686_return_output := mul2_uxn_opcodes_h_l2931_c40_c686_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_6315_return_output;
     VAR_div_uxn_opcodes_h_l2932_c40_ace9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c7f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue := VAR_mul2_uxn_opcodes_h_l2931_c40_c686_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_7fc7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_584a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output;

     -- div[uxn_opcodes_h_l2932_c40_ace9] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2932_c40_ace9_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2932_c40_ace9_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2932_c40_ace9_phase <= VAR_div_uxn_opcodes_h_l2932_c40_ace9_phase;
     div_uxn_opcodes_h_l2932_c40_ace9_ins <= VAR_div_uxn_opcodes_h_l2932_c40_ace9_ins;
     div_uxn_opcodes_h_l2932_c40_ace9_previous_stack_read <= VAR_div_uxn_opcodes_h_l2932_c40_ace9_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2932_c40_ace9_return_output := div_uxn_opcodes_h_l2932_c40_ace9_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_584a_return_output;
     VAR_div2_uxn_opcodes_h_l2933_c40_6f87_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_7fc7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue := VAR_div_uxn_opcodes_h_l2932_c40_ace9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_2ae0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_return_output;

     -- div2[uxn_opcodes_h_l2933_c40_6f87] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2933_c40_6f87_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2933_c40_6f87_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2933_c40_6f87_phase <= VAR_div2_uxn_opcodes_h_l2933_c40_6f87_phase;
     div2_uxn_opcodes_h_l2933_c40_6f87_ins <= VAR_div2_uxn_opcodes_h_l2933_c40_6f87_ins;
     div2_uxn_opcodes_h_l2933_c40_6f87_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2933_c40_6f87_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2933_c40_6f87_return_output := div2_uxn_opcodes_h_l2933_c40_6f87_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_803c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_803c_return_output;
     VAR_and_uxn_opcodes_h_l2934_c40_68ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ae0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue := VAR_div2_uxn_opcodes_h_l2933_c40_6f87_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_9551] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_return_output;

     -- and[uxn_opcodes_h_l2934_c40_68ed] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2934_c40_68ed_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2934_c40_68ed_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2934_c40_68ed_phase <= VAR_and_uxn_opcodes_h_l2934_c40_68ed_phase;
     and_uxn_opcodes_h_l2934_c40_68ed_ins <= VAR_and_uxn_opcodes_h_l2934_c40_68ed_ins;
     and_uxn_opcodes_h_l2934_c40_68ed_previous_stack_read <= VAR_and_uxn_opcodes_h_l2934_c40_68ed_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2934_c40_68ed_return_output := and_uxn_opcodes_h_l2934_c40_68ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_c8d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output;
     VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_9551_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue := VAR_and_uxn_opcodes_h_l2934_c40_68ed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_342d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output;

     -- and2[uxn_opcodes_h_l2935_c40_ebb9] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2935_c40_ebb9_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2935_c40_ebb9_phase <= VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_phase;
     and2_uxn_opcodes_h_l2935_c40_ebb9_ins <= VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_ins;
     and2_uxn_opcodes_h_l2935_c40_ebb9_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_return_output := and2_uxn_opcodes_h_l2935_c40_ebb9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_d2af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_342d_return_output;
     VAR_ora_uxn_opcodes_h_l2936_c40_342d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_d2af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue := VAR_and2_uxn_opcodes_h_l2935_c40_ebb9_return_output;
     -- ora[uxn_opcodes_h_l2936_c40_342d] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2936_c40_342d_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2936_c40_342d_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2936_c40_342d_phase <= VAR_ora_uxn_opcodes_h_l2936_c40_342d_phase;
     ora_uxn_opcodes_h_l2936_c40_342d_ins <= VAR_ora_uxn_opcodes_h_l2936_c40_342d_ins;
     ora_uxn_opcodes_h_l2936_c40_342d_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2936_c40_342d_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2936_c40_342d_return_output := ora_uxn_opcodes_h_l2936_c40_342d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_8325] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_8cea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output;
     VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_8325_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue := VAR_ora_uxn_opcodes_h_l2936_c40_342d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_243b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_2717] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output;

     -- ora2[uxn_opcodes_h_l2937_c40_43d2] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2937_c40_43d2_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2937_c40_43d2_phase <= VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_phase;
     ora2_uxn_opcodes_h_l2937_c40_43d2_ins <= VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_ins;
     ora2_uxn_opcodes_h_l2937_c40_43d2_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_return_output := ora2_uxn_opcodes_h_l2937_c40_43d2_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2717_return_output;
     VAR_eor_uxn_opcodes_h_l2938_c40_18e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_243b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue := VAR_ora2_uxn_opcodes_h_l2937_c40_43d2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_4fc2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output;

     -- eor[uxn_opcodes_h_l2938_c40_18e9] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2938_c40_18e9_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2938_c40_18e9_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2938_c40_18e9_phase <= VAR_eor_uxn_opcodes_h_l2938_c40_18e9_phase;
     eor_uxn_opcodes_h_l2938_c40_18e9_ins <= VAR_eor_uxn_opcodes_h_l2938_c40_18e9_ins;
     eor_uxn_opcodes_h_l2938_c40_18e9_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2938_c40_18e9_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2938_c40_18e9_return_output := eor_uxn_opcodes_h_l2938_c40_18e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_610c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output;
     VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_610c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue := VAR_eor_uxn_opcodes_h_l2938_c40_18e9_return_output;
     -- eor2[uxn_opcodes_h_l2939_c40_58dd] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2939_c40_58dd_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2939_c40_58dd_phase <= VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_phase;
     eor2_uxn_opcodes_h_l2939_c40_58dd_ins <= VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_ins;
     eor2_uxn_opcodes_h_l2939_c40_58dd_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_return_output := eor2_uxn_opcodes_h_l2939_c40_58dd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_2954] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_e399] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_return_output;

     -- Submodule level 74
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_e399_return_output;
     VAR_sft_uxn_opcodes_h_l2940_c40_78aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_2954_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue := VAR_eor2_uxn_opcodes_h_l2939_c40_58dd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_6f38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_return_output;

     -- sft[uxn_opcodes_h_l2940_c40_78aa] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2940_c40_78aa_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2940_c40_78aa_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2940_c40_78aa_phase <= VAR_sft_uxn_opcodes_h_l2940_c40_78aa_phase;
     sft_uxn_opcodes_h_l2940_c40_78aa_ins <= VAR_sft_uxn_opcodes_h_l2940_c40_78aa_ins;
     sft_uxn_opcodes_h_l2940_c40_78aa_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2940_c40_78aa_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2940_c40_78aa_return_output := sft_uxn_opcodes_h_l2940_c40_78aa_return_output;

     -- Submodule level 75
     VAR_sft2_uxn_opcodes_h_l2941_c40_8221_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6f38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue := VAR_sft_uxn_opcodes_h_l2940_c40_78aa_return_output;
     -- sft2[uxn_opcodes_h_l2941_c40_8221] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2941_c40_8221_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2941_c40_8221_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2941_c40_8221_phase <= VAR_sft2_uxn_opcodes_h_l2941_c40_8221_phase;
     sft2_uxn_opcodes_h_l2941_c40_8221_ins <= VAR_sft2_uxn_opcodes_h_l2941_c40_8221_ins;
     sft2_uxn_opcodes_h_l2941_c40_8221_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2941_c40_8221_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2941_c40_8221_return_output := sft2_uxn_opcodes_h_l2941_c40_8221_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue := VAR_sft2_uxn_opcodes_h_l2941_c40_8221_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_e399] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_e399_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_4fc2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4fc2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_2717] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2717_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_8cea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_8cea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_342d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_342d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_c8d0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_c8d0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_803c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_803c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_584a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_584a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_6315] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_6315_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_e649] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e649_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_2738] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2738_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_80f9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_80f9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_be48] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_be48_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_861d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_861d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_d469] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_d469_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_1f88] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_1f88_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_9e97] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_9e97_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_ab74] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_ab74_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_2925] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_2925_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_940b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_940b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_ecea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_ecea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_c34a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_c34a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_64d0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_64d0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_8a8e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8a8e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_dbce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_dbce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_02a6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_02a6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_710d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_710d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_99a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_99a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_f183] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f183_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_e3ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e3ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_441a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_441a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_baa1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_baa1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_e71f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e71f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_2e01] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_2e01_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_3694] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_3694_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_4a69] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_4a69_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_0a1f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0a1f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_8107] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8107_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_657e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_657e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_e62e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e62e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_b6d0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_b6d0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_1a20] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_1a20_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_ef42] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_ef42_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_9668] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_9668_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_b5d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_b5d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_1697] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_1697_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_2b56] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_2b56_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_3334] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_3334_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_2c37] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2c37_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_23f6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_23f6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_e234] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_e234_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_2c67] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2c67_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_0a06] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_0a06_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_97cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_97cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_22b2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22b2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_78c1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_78c1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_7a00] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7a00_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_9d54] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9d54_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_f88f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f88f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_86d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_86d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_fcf8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_fcf8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_0118] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_0118_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_3b37] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_3b37_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_39b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_39b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_4bfe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_4bfe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_ab02] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_ab02_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_dc6f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_dc6f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_1f7a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_1f7a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_c075] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_c075_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c2_9b09] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output;

     -- Submodule level 146
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2965_c30_bf00] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_bf00_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2970_c32_b842] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_b842_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2952_c68_a2a1] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_a2a1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_43be LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_43be_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_72c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_72c7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2962_c39_03bf] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_03bf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2967_c34_ebf0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_ebf0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2964_c34_55e4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_55e4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2968_c37_84c8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_84c8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2944_c17_d73a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_d73a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2966_c33_8a1a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_8a1a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2963_c40_d443] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_d443_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2958_c3_14de] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_14de_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output.is_stack_write;

     -- Submodule level 147
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_d73a_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_14de_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_72c7_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_a95c] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_left;
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output := BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_30ea LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_30ea_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_9b09_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_03bf_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_d443_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_55e4_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_bf00_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_8a1a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_ebf0_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_84c8_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_72c7_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_b842_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_57f9 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_57f9_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_43be_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c58_7e32] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_7e32_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_a2a1_return_output);

     -- Submodule level 148
     VAR_MUX_uxn_opcodes_h_l2952_c29_9993_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output;
     VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_a95c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_57f9_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_57f9_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_7e32_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_30ea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_30ea_return_output;
     -- MUX[uxn_opcodes_h_l2953_c20_c6e0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2953_c20_c6e0_cond <= VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_cond;
     MUX_uxn_opcodes_h_l2953_c20_c6e0_iftrue <= VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_iftrue;
     MUX_uxn_opcodes_h_l2953_c20_c6e0_iffalse <= VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_return_output := MUX_uxn_opcodes_h_l2953_c20_c6e0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_1da1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_dacc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_return_output;

     -- Submodule level 149
     VAR_sp1_uxn_opcodes_h_l2947_c3_7e6e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_dacc_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2949_c3_7e9c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_1da1_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_right := VAR_MUX_uxn_opcodes_h_l2953_c20_c6e0_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse := VAR_sp0_uxn_opcodes_h_l2949_c3_7e9c;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue := VAR_sp1_uxn_opcodes_h_l2947_c3_7e6e;
     -- sp0_MUX[uxn_opcodes_h_l2946_c2_b109] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2946_c2_b109_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_cond;
     sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue;
     sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output := sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2946_c2_b109] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2946_c2_b109_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_cond;
     sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iftrue;
     sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output := sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l2952_c29_9993_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_b109_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c29_9993_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_b109_return_output;
     -- MUX[uxn_opcodes_h_l2952_c29_9993] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c29_9993_cond <= VAR_MUX_uxn_opcodes_h_l2952_c29_9993_cond;
     MUX_uxn_opcodes_h_l2952_c29_9993_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c29_9993_iftrue;
     MUX_uxn_opcodes_h_l2952_c29_9993_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c29_9993_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c29_9993_return_output := MUX_uxn_opcodes_h_l2952_c29_9993_return_output;

     -- Submodule level 151
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c19_d680] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_d680_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2952_c29_9993_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_d680_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_02c3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_return_output;

     -- Submodule level 153
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_02c3_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2953_c2_a3cb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_left;
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output := BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output;

     -- Submodule level 154
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a3cb_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2955_c24_dd8c] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_stack_address;
     stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_value <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_value;
     stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_return_output := stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_return_output;

     -- Submodule level 155
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_dd8c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_ins_a <= REG_VAR_ins_a;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_is_wait <= REG_VAR_is_wait;
REG_COMB_stack_address <= REG_VAR_stack_address;
REG_COMB_previous_stack_read <= REG_VAR_previous_stack_read;
REG_COMB_opc_result <= REG_VAR_opc_result;
REG_COMB_opc_eval_result <= REG_VAR_opc_eval_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     sp0 <= REG_COMB_sp0;
     sp1 <= REG_COMB_sp1;
     ins_a <= REG_COMB_ins_a;
     opc <= REG_COMB_opc;
     stack_index <= REG_COMB_stack_index;
     is_wait <= REG_COMB_is_wait;
     stack_address <= REG_COMB_stack_address;
     previous_stack_read <= REG_COMB_previous_stack_read;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
